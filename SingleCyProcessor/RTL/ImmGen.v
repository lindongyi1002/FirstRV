/*==============================================================================================
    Filename            :   ImmGen.v
    Author              :   Lindongyi
    Description         :   1. Generate sign-extended immeditate for R-type, lw, sw, beq;
    Called by           :   
    Revision History    :   23-05-04
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/


module ImmGen(Inst, Imm);

input       [31:0]  Inst;
output  reg [31:0]  Imm;    //sign-extended

always@(*)begin
    case(Inst[6:0])
        7'b0000011: Imm = {{20{Inst[31]}},Inst[31:20]};                     //lw sign-extended
        7'b0100011: Imm = {{20{Inst[31]}},Inst[31:25],Inst[11:7]};          //sw sign-extended
        7'b1100011: Imm = {{19{Inst[31]}},Inst[31],Inst[7],Inst[30:25],Inst[11:8],1'b0};    //beq
        7'b0110011: Imm = 32'b0;    //R-type instructions have none imm output
        default:    Imm = 32'b0;
    endcase
end

endmodule