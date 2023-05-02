/*==============================================================================================
    Filename            :   ALU32.v
    Author              :   Lindongyi
    Description         :   1. 可以实现与或加减功能, 可以实现小于比较置位功能, 可以实现或非功能;
                            2. 使用4位输入控制ALU功能;
                            3. 纯组合逻辑电路; 
    Called by           :   
    Revision History    :   23-05-02
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

//驼峰命名法
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
        4'b0001:    ALUOut <= in0 | in1;                //or
        4'b0010:    ALUOut <= in0 + in1;                //add
        4'b0110:    ALUOut <= in0 - in1;                //sub
        4'b0111:    ALUOut <= (in0 < in1)? 1'b1 : 0;    //slt
        4'b1100:    ALUOut <= ~(in0 | in1);             //nor
        default:    ALUOut <= 0;
    endcase
end


endmodule


