/*==============================================================================================
    Filename            :   SingleCyProcessor_Top.v
    Author              :   Lindongyi
    Description         :   1. Instantiation all modules include DataMem;
    Called by           :   
    Revision History    :   23-05-09
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

`timescale 1ns/1ps
module SingleCyProcessor_Top(Clk, Rst_n);

input               Clk;
input               Rst_n;

//PC
wire                PC;

//InstMem
wire                Inst;

//InstCtrl
wire    [6:0]       Opcode = Inst[6:0];
wire                Branch;
wire                MemRead;
wire                MemtoReg;
wire    [1:0]       ALUOp;
wire                MemWrite;
wire                ALUSrc;
wire                RegWrite;

//Regeseters
wire    [4:0]       AddrRs1 = Inst[19:15];
wire    [4:0]       AddrRs2 = Inst[24:20];
wire    [4:0]       AddrRd  = Inst[11:7];
wire    [31:0]      WrData;
wire    [31:0]      RdData1;
wire    [31:0]      RdData2;
//to Registers WrData MUX
assign WrData = (MemtoReg == 1)? DataMem_Data_out : ALUOut;

//ImmGen
wire    [31:0]      Imm;
            
//ALU
wire    [31:0]      ALU_in0;
wire    [31:0]      ALU_in1;
wire    [3:0]       ALUCtrl;
wire                Zero;
wire    [31:0]      ALUOut;
//to ALU_in1 MUX
assign ALU_in1 = (ALUSrc == 1)? Imm : RdData2;

//ALUCtrl
wire    [6:0]       funct7 = Inst[31:25];
wire    [2:0]       funct3 = Inst[14:12];

//DataMem
wire    [31:0]      DataMem_Addr;
wire    [31:0]      DataMem_Data_in;
wire    [31:0]      DataMem_Data_out;



PC PC_u0(
    .Clk(Clk),
    .Rst_n(Rst_n),
    .Branch(Branch),
    .Zero(Zero),
    .Imm(Imm),
    .PC_i(PC),
    .PC_o(PC)
);

InstMem InstMem_u0(
    .AddrInst(PC),
    .Inst(Inst)
);

InstCtrl InstCtrl_u0(
    .Clk(Clk),
    .Opcode(Opcode),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
);

Regesters Regesters_u0(
    .Clk(Clk),
    .AddrRs1(AddrRs1),
    .AddrRs2(AddrRs2),
    .AddrRd(AddrRd),
    .WrData(WrData),
    .RegWrite(RegWrite),
    .RdData1(RdData1),
    .RdData2(RdData2)
);

ImmGen ImmGen_u0(
    .Inst(Inst),
    .Imm(Imm)
);

ALU32 ALU32_u0(
    .in0(ALU_in0),
    .in1(ALU_in1),
    .ALUCtrl(ALUCtrl),
    .Zero(Zero),
    .ALUOut(ALUOut)
);

ALUCtrl ALUCtrl_u0(
    .funct7(funct7),
    .funct3(funct3),
    .ALUOp(ALUOp),
    .ALUCtrl(ALUCtrl)
);

DataMem DataMem_u0(
    .Clk(Clk),
    .Rst_n(Rst_n),
    .Addr(DataMem_Addr),
    .Wr_en(MemWrite),
    .Data_in(DataMem_Data_in),
    .Rd_en(MemRead),
    .Data_out(DataMem_Data_out)
);
endmodule