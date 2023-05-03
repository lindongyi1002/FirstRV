`timescale 1ns/1ns
`define INST_ADD 32'b00000000_00101_01111_000_10000_0110011 //funct7_rs2_rs1_funct3_rd_opcode
`define INST_BEQ 32'b00000011_01011_01010_000_00100_1100011 //imm[12|10:5]_rs2_rs1_funct3_imm[4:1|11]_opcode

module ALUCTRL_tb();

    reg         [6:0]   funct7;
    reg         [2:0]   funct3;
    reg         [1:0]   ALUOp;
    wire        [3:0]   ALUCtrl;

    reg        [31:0]   in0;
    reg        [31:0]   in1;

    wire                Zero;
    wire       [31:0]   ALUOut;

ALUCtrl ALUCtrl_u0(
    .funct7(funct7),
    .funct3(funct3),
    .ALUOp(ALUOp),
    .ALUCtrl(ALUCtrl)
);

ALU32 ALU32_u0(
    .in0(in0),
    .in1(in1),
    .ALUCtrl(ALUCtrl),
    .Zero(Zero),
    .ALUOut(ALUOut)
);

initial begin
    //reset
    in0 = 32'b0;
    in1 = 32'b0;
    ALUOp = 2'b11;
    funct7 = 7'b0;
    funct3 = 3'b0;
    #1000;

    //add x16, x15, x5
    //x15 = 32'd10, x5 = 32'd20
    in0 = 32'd10;
    in1 = 32'd20;
    ALUOp = 2'b10;
    funct7 = INST_ADD[31:25];
    funct3 = INST_ADD[14:12];
    #1000;

    //beq x10, x11, 100
    //x15 = 32'd10, x5 = 32'd20
    in0 = 32'd10;
    in1 = 32'd20;
    ALUOp = 2'b01;
    funct7 = INST_BEQ[31:25];
    funct3 = INST_BEQ[14:12];
    #1000;
    $stop;
end

endmodule