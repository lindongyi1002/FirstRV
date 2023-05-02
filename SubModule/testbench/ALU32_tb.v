`timescale 1ns/1ps

module ALU32_tb();
    wire        [31:0]  in0;
    wire        [31:0]  in1;
    wire        [3:0]   ALUCtrl;

    reg                 Zero;
    reg         [31:0]  ALUOut;

ALU32 ALU32_u0(
    .in0(in0),
    .in1(in1),
    .ALUCtrl(ALUCtrl),
    .Zero(Zero),
    .ALUOut(ALUOut)
);

initial begin
    in0 = 32'b0;
    in1 = 32'b0;
    ALUCtrl = 4'b0;

    //and
    #1000;
    in0 = 32'd10;
    in1 = 32'd20;
    ALUCtrl = 4'b0000;

    //or
    #1000;
    ALUCtrl = 4'b0001;

    //add
    #1000;
    ALUCtrl = 4'b0010;

    //sub
    #1000;
    ALUCtrl = 4'b0110;

    //slt
    #1000;
    ALUCtrl = 4'b0111;

    //nor
    #1000;
    ALUCtrl = 4'b1100;

    #3000;
    $stop;
end
endmodule