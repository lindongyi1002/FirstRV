* 在边缘检测时, 对如下verilog代码进行测试
```verilog
//Tx_data_ready beat 1 clk
always@(posedge Clk or negedge Rst_n)begin
    if(!Rst_n)
        Tx_data_ready_reg0 <= 0;
    else
        Tx_data_ready_reg0 <= Tx_data_ready;
end
//posedge & negedge
assign Tx_data_ready_posedge = Tx_data_ready_reg0 && !Tx_data_ready;
assign Tx_data_ready_negedge = !Tx_data_ready_reg0 && Tx_data_ready;
```
* 第一种tb代码如下:
```verilog
initial Clk = 1;
always #(`clk_period / 2) Clk = !Clk;

initial begin
    Rst_n = 0;
    FIFO_wr_en = 0;
    ROIC_data = 0;
    Tx_data_ready = 0;
    #(`clk_period * 10) Rst_n = 1;
    #(`clk_period * 10);
    //Write data
    repeat(25)begin
        ROIC_data = {$random} % 1024;
        FIFO_wr_en = 1;
        #(`clk_period);
        FIFO_wr_en = 0;
        #(`clk_period * 10);
    end
    #(`clk_period * 100);
    //Read data
    repeat(25)begin
        #(`clk_period * 100)    Tx_data_ready = 1;
        #(`clk_period * 3)      Tx_data_ready = 0;
    end
    #(`clk_period * 200);
    $stop;
end
```
对于第一种tb代码, 时钟和复位用的时阻塞赋值(=), Tx_data_ready用的也是阻塞赋值, 其仿真波形如下:
![[Fig_Bed/modelsim_Tx_data_ready.png| 1200]]
从仿真图中可以看到Tx_data_ready和Tx_data_ready_reg0并没有打拍, 而且posedge和negedge都没有保持一个周期.

---
* 第二种tb代码如下, 将其他信号的阻塞赋值改成非阻塞赋值:
```verilog
initial Clk = 1;
always #(`clk_period / 2) Clk = !Clk;

initial begin
    Rst_n = 0;
    FIFO_wr_en <= 0;
    ROIC_data <= 0;
    Tx_data_ready <= 0;
    #(`clk_period * 10) Rst_n = 1;
    #(`clk_period * 10);
    //Write data
    repeat(25)begin
        ROIC_data <= {$random} % 1024;
        FIFO_wr_en <= 1;
        #(`clk_period);
        FIFO_wr_en <= 0;
        #(`clk_period * 10);
    end
    #(`clk_period * 100);
    //Read data
    repeat(25)begin
        #(`clk_period * 100)    Tx_data_ready <= 1;
        #(`clk_period * 3)      Tx_data_ready <= 0;
    end
    #(`clk_period * 200);
    $stop;
end
```
把initial中的(=)改成(<=)仿真结果就正确了,打拍和上下边沿都有了, 究其原因还是阻塞赋值和非阻塞赋值的区别, 仿真结果图如下:
![[Fig_Bed/modelsim_Tx_data_ready2.png|1200]]
