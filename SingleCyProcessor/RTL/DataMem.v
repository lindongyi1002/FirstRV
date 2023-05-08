/*==============================================================================================
    Filename            :   DataMem.v
    Author              :   Lindongyi
    Description         :   1. Memory for reading or writing 32bit data
                            2. just design for lw and sw
                            3. Multi-bit wide reads and writes are not supported
    Called by           :   
    Revision History    :   23-05-07
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

module DataMem(Clk, Rst_n, Addr, Wr_en, Data_in, Rd_en, Data_out);

input                   Clk;
input                   Rst_n;

input           [31:0]  Addr;           //Addr = regs[n] + imm

input                   Wr_en;
input           [31:0]  Data_in;

input                   Rd_en;
output          [31:0]  Data_out;

reg             [31:0]  ram[63:0];

always@(posedge Clk or negedge Rst_n)begin
    if(!Rst_n)
        ram[Addr[7:2]] <= 6'b0;
    else if(Wr_en)
        ram[Addr[7:2]] <= Data_in;      //it is not clear why Addr started with 2 instead of 0(refer to tinyriscv)
    else
        ram[Addr[7:2]] <= ram[Addr[7:2]];
end


endmodule