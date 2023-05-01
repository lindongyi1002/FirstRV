在学习dc的时候，我在做lab1时遇到了一个非常简单，但是困扰了我好久的问题：

当按照lab要求，逐步输入如下指令：
```tcl
read_verilog
link
check_design
write_file -format ddc -hierarchy -output unmapped/MY_TOP.ddc
```

问题就出在这个write上，在这个lab中，输出的.ddc文件是被保存在unmapped文件夹中的，但是我在执行这个指令的时候出现了如下报错
```shell
Error: Unable to open DDC file 'unmapped/MY_TOP.ddc' for writing. (DDC-1)
Error: Write command failed. (UID-25)
```
我怀疑是我没有使用lab自带的文件导致的，或者环境变量配置有问题，但是我检查并没有发现什么异常。

## 解决方式是：

将unmapped的路径填写完整，从home开始，
```shell
/home/lindongyi/DC_practice/practice1/unmapped/MY_TOP.ddc
```
这样执行的结果就正常了，返回值为1，问题解决。

