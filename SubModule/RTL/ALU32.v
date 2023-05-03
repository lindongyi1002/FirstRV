/*==============================================================================================
    Filename            :   ALU32.v
    Author              :   Lindongyi
    Description         :   1. Realize and, or, add, sub, slt, nor;
                            2. Use 4bit ALUCtrl;
                            3. Pure combinatorial logic circuits; 
    Called by           :   
    Revision History    :   23-05-02
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

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


