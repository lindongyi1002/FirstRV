`timescale 1ns/1ps
`define CLK_PD 20

module Single_Top_tb();

SingleCyProcessor_Top Processor_u0(
    .Clk(Clk),
    .Rst_n(Rst_n)
);

initial Clk = 1;
always#(`CLK_PD / 2) Clk = ~Clk;

initial begin
    Rst_n <= 0;
    #(`CLK_PD * 20);
    Rst_n <= 1;
    #(`CLK_PD * 1000);
    $stop;
end



endmodule