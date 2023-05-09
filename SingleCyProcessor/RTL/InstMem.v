/*==============================================================================================
    Filename            :   InstMem.v
    Author              :   Lindongyi
    Description         :   1. For storing 32-bit Instructions;
                            2. Read-only memory;
    Called by           :   
    Revision History    :   23-05-04
    Email               :   1292471097@qq.com
    Company             :   Jiang Group of Center for Carbon-based Electronics, Peking University
    Copyright           :   2023, Lindongyi, All right reserved
==============================================================================================*/

module InstMem(AddrInst, Inst);

input       [31:0]  AddrInst;
output  reg [31:0]  Inst;

reg         [31:0]  rom[11:0];  //it can store 4096 32bit data;


always@(*)begin
    Inst = rom[AddrInst >> 2];  //把地址除4是为了让rom单元连续，因为pc地址总是4的倍数，如***4，***8，**12等等，除4后即为1，2，3，就变成了连续的rom地址。
end


endmodule