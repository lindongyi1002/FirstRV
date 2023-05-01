## 报错描述:
    Instantiation of '???' failed. The design unit was not found.
在使用Quartus与ModelSim联合仿真时,由于使用了不可综合的module放在testbench中,导致出现标题中的错误,在ModelSim中提示上述错误并显示error loding design.
![[Fig_Bed/b7c2fd07d8a9486db1ea52c84785db5f.png]]
## 问题原因
在使用Quartus时,由于硬件原因,没有办法直接调试硬件参数,故使用一个不能被综合的module来给Top module提供数据,该module被例化在testbench中与Top module相连接.
该module无法被综合,也就无法像其他design一样正常调用.只能在tesetbench中使用.
如果不经过改动,Quartus综合后无错误和警告,只有在modelsim仿真时提示如标题的错误.

## 解决办法1(不推荐)
第一种解决办法十分简单,但是不便于逻辑梳理,也不符合一般的设计规范,在verilog设计过程中,我们一般遵循在一个.v文件中放置一个module,多个module存放在一个v文件中不利于代码阅读.

方法如下:
将该不可综合的module与top module下的任一module放置在同一个.v文件中,即一个.v文件中同时放置一个可综合的module和一个不可综合的module. 这样就可以被modelsim查找到.从而正常仿真.

## 解决办法2(推荐)
第二种解决办法属于常规的解决办法,步骤稍多,但是逻辑清晰,推荐.

方法如下:
1. 重新添加testbench文件,在添加时将该不可综合的module一起与testbench文件添加进来.
    ![[Fig_Bed/bdae197b370f4243985618bcdedb73fd.png|1300]]
    ![[Fig_Bed/124f65d5b8514f4d988fab68dee1bb87.png]]
    然后add-ok-ok-apply-ok即可.
2. 重新综合
3. 重新调用modelsim进行仿真.

这样同时将该不可综合的module也加入到了testbench当中,在modelsim中仿真的时候就可以正常找到和调用了.


**!!!问题解决!!!**