/*==============================================================================================
    Filename            :   Regesters.v
    Author              :   Lindongyi
    Description         :   1.set 32 32-bit general-purpose regs;
    Called by           :   
    Revision History    :   23-05-04
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

`include "./defines.v"

module Regesters(Clk, AddrRs1, AddrRs2, AddrRd, WrData, RdData1, RdData2);

input               Clk;

input       [4:0]   AddrRs1;
input       [4:0]   AddrRs2;
input       [4:0]   AddrRd;
input       [31:0]  WrData;
input               RegWrite;

output      [31:0]  RdData1;
output      [31:0]  RdData2;

reg         [31:0]  regs[31:0];    //set 31 32-bit gp regs;

//Read, clk is not needed
assign RdData1 = (AddrRs1 == `X0)? `ZeroWord : regs[AddrRs1];  //if read register is x0, output 32'b0, else output normal;
assign RdData2 = (AddrRs2 == `X0)? `ZeroWord : regs[AddrRs2];  //if read register is x0, output 32'b0, else output normal;

//Write, need clk
always(posedge Clk)begin
    if((RegWrite == 1'b1) && (AddrRd != `X0))
        regs[AddrRd] <= WrData;
    else
        regs[AddrRd] <= regs[AddrRd];
end


endmodule