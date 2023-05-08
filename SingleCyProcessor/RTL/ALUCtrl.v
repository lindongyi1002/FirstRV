/*==============================================================================================
    Filename            :   ALUCtrl.v
    Author              :   Lindongyi
    Description         :   1.Creat 4bit ALUCtrl instrouction by ALUOp and funct7 & funct3;
    Called by           :   
    Revision History    :   23-05-03
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

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