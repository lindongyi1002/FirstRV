/*==============================================================================================
    Filename            :   InstCtrl.v
    Author              :   Lindongyi
    Description         :   1.Receive 7-bit Opcode which come from 32bit Instruction;
                            2.Six 1-bit control lines ans one 2-bit ALUOp lines are generated;
    Called by           :   
    Revision History    :   23-05-03
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

`timescale 1ns/1ps
module InstCtrl(Clk, Opcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

input                   Clk;

input           [6:0]   Opcode;

output  reg             Branch;
output  reg             MemRead;
output  reg             MemtoReg;
output  reg     [1:0]   ALUOp;
output  reg             MemWrite;
output  reg             ALUSrc;
output  reg             RegWrite;

always@(posedge Clk )begin
    case(Opcode)
        7'b0110011: begin       //R-type instruction
                        ALUSrc      <= 0;
                        MemtoReg    <= 0;
                        RegWrite    <= 1'b1;
                        MemRead     <= 0;
                        MemWrite    <= 0;
                        Branch      <= 0;
                        ALUOp       <= 2'b10;
                    end
        7'b0000011: begin       //lw instruction
                        ALUSrc      <= 1'b1;
                        MemtoReg    <= 1'b1;
                        RegWrite    <= 1'b1;
                        MemRead     <= 1'b1;
                        MemWrite    <= 0;
                        Branch      <= 0;
                        ALUOp       <= 2'b00;
                    end
        7'b0100011: begin       //sw instruction
                        ALUSrc      <= 1'b1;
                        MemtoReg    <= 1'b?;
                        RegWrite    <= 0;
                        MemRead     <= 0;
                        MemWrite    <= 1'b1;
                        Branch      <= 0;
                        ALUOp       <= 2'b00;
                    end
        7'b1100011: begin       //sw instruction
                        ALUSrc      <= 0;
                        MemtoReg    <= 1'b?;
                        RegWrite    <= 0;
                        MemRead     <= 0;
                        MemWrite    <= 1'b1;
                        Branch      <= 0;
                        ALUOp       <= 2'b01;
                    end
        default:    begin
                        RegWrite    <= 0;
                        MemRead     <= 0;
                        MemWrite    <= 0;
                    end
    endcase
end

endmodule