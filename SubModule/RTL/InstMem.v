/*==============================================================================================
    Filename            :   InstMem.v
    Author              :   Lindongyi
    Description         :   1. For storing 32-bit Instructions;
                            2. Only Read memory;
    Called by           :   
    Revision History    :   23-05-04
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

module InstMem();

input               Clk;

input       [31:0]  AddrInst;

output      [31:0]  Inst;

endmodule