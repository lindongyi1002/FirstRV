/*==============================================================================================
    Filename            :   PC.v
    Author              :   Lindongyi
    Description         :   1. if both of ALU_Zero and Branch signal are high level, PC branch;
                            2. else PC + 4;
    Called by           :   
    Revision History    :   23-05-04
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

module PC();

input               Clk;
input               Rst_n;

input               Branch;
input               Zero;

input       [11:0]  Imm;

input       [31:0]  PC_i;
output  reg [31:0]  PC_o;

wire        [11:0]  offset;

assign offset = Imm << 1'b1;

always@(posedge Clk)begin
    if(!Rst_n)
        PC_o <= 0;
    else if(Branch == 1'b1 && Zero == 1'b1)
        PC_o <= PC_i + offset;
    else
        PC_o <= PC_i + 4'h4;
end

endmodule