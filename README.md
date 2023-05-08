# FirstRV

始于2023.04.22

---

- 为了学习RISC-V处理器, 从零开始编写最简单的RV处理器;

## 学习计划

- [ ] 学习RISC-V指令集;
- [ ] 学习计算机组成与设计-硬件/软件接口-RISC-V版
- [ ] 学习蜂鸟E203处理器;
- [ ] 9月份前完成First_RV处理器的编写, 计划周期4个月;

## FirstRV处理器内核计划

- 仅使用RV32I基本指令集, 不包括其他的扩展指令集;
- 使用类似蜂鸟E203的简单译码;
- 分支预测使用最简单的BTFN静态预测(Back TAKEN, Forward Not Taken);

## CPU构思

- 我理解的CPU以将ISA中的指令全部正确执行为最低要求, 同时在此基础上优化结构, 提升性能;
- 在设计学习时先从简单的指令开始, 走完全部设计流程后把ISA中的所有指令都补全并优化即可实现完整CPU;
- First_RV处理器要实现RV32I指令集, 那么就要实现37条指令;
- 设计数据通路的合理方法是, 分析每类RISC-V指令需要哪些主要执行单元. 在RISC-V的实现中, 数据通路单元包括指令存储器, 数据存储器, 寄存器堆和ALU;
- 从基础开始, 先实现一个32位RISC-V的核心子集, 包括如下7条指令[书中以64位讲解]:
	- 存储器访问指令lw和sw;
	- 算术逻辑指令add, sub, and, or;
	- 条件分支指令beq;

## 单周期处理器设计(FirstRV/SingleCyProcessor)

### 0. 数据通路

<img src="https://cdn.jsdelivr.net/gh/lindongyi1002/FigBed/ObFigBed/20230503125214.png" style="zoom:150%;" />

### 1. ALU模块

- 设计的ALU可以实现and, or, add, sub, slt, nor功能, 有4位ALUCtrl控制, 参考计组RV附录A.5实现, 具体代码如下.

```verilog
//CamelCase nominate
`timescale 1ns/1ps
module ALU32(in0, in1, ALUCtrl, Zero, ALUOut);

input       [31:0]  in0;
input       [31:0]  in1;
input       [3:0]   ALUCtrl;

output              Zero;
output  reg [31:0]  ALUOut;

//Zero
assign Zero = (ALUOut == 0);

//logic & arithmetic iperation
always@(in0 or in1 or ALUCtrl)begin
    case(ALUCtrl)
        4'b0000:    ALUOut <= in0 & in1;                //and
        4'b0001:    ALUOut <= in0 | in1;                //or, logic "||" or bit "|"
        4'b0010:    ALUOut <= in0 + in1;                //add
        4'b0110:    ALUOut <= in0 - in1;                //sub
        4'b0111:    ALUOut <= (in0 < in1)? 1'b1 : 0;    //slt
        4'b1100:    ALUOut <= ~(in0 | in1);             //nor
        default:    ALUOut <= 0;
    endcase
end

endmodule
```

### 2. ALU_CTRL

输入funct7, funct3, ALUOp, 并根据此产生4bit ALUCtrl信号给ALU模块.

```verilog
`timescale 1ns/1ps
module ALUCtrl(funct7, funct3, ALUOp, ALUCtrl);

input       [6:0]   funct7;
input       [2:0]   funct3;
input       [1:0]   ALUOp;
output  reg [3:0]   ALUCtrl;

//According to Fig4-12, the following code is designed
always@(*)begin
    case(ALUOp)
        2'b00:  ALUCtrl <= 4'b0010;
        2'b01:  ALUCtrl <= 4'b0110;
        2'b10:  ALUCtrl <=  (funct7 == 7'b0000000 && funct3 == 3'b000)? 4'b0010 :
                            (funct7 == 7'b0100000 && funct3 == 3'b000)? 4'b0110 :
                            (funct7 == 7'b0000000 && funct3 == 3'b111)? 4'b0000 :
                            (funct7 == 7'b0000000 && funct3 == 3'b110)? 4'b0001 :
                            4'b1111;
        default: ALUCtrl <= 4'b1111;
    endcase
end

endmodule
```

