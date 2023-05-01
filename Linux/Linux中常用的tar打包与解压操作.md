* Linux中常用的打包文件格式为.tar；
* Linux中常用的压缩文件格式为.tar.gz；

## 1. tar打包常用命令有：
>-c: 建立压缩档案
>-x：解压
>-t：查看内容
>-r：向压缩归档文件末尾追加文件【.tar.gz不可用】
>-u：更新原tar【.tar.gz不可用】【如果tar包中的某一或某些文件发生了修改，可以用该命令将tar包中的对应文件进行更新】
以上五个commends每次压缩或解压可以和其他命令连用但是只能用其中一个；

>-z：有gzip属性的
>-j：有bz2属性的
>-Z：有compress属性的
>-v：显示所有过程（文件）
>-O：将文件解开到标准输出
以上五个commends在压缩或解压缩时时可选的，可用可不用；

>-f：这个命令是在压缩或者解压缩时必须使用的，而且要置于所有命令中的最后位置，其后只能接档案名（文件名）。

## 2. 其他命令：

>-C：指定解压缩的目录；

## 3. 例子：

### (1) 把a.txt, b.txt, c.tcl, d.doc四个文件打包成一个tar文件并命名为abcd.tar：
```shell
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -cvf abcd.tar a.txt b.txt c.tcl d.doc 
a.txt
b.txt
c.tcl
d.doc
```
### (2) 把a.txt, b.txt, c.tcl, d.doc四个文件打包并压缩成一个tar.gz文件并命名为abcd.tar.gz：
```shell
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -czvf abcd.tar.gz a.txt b.txt c.tcl d.doc
a.txt
b.txt
c.tcl
d.doc
```
### (3) 查看abdc.tar和abcd.tar.gz中包含的文件
```shell
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -tf abcd.tar
a.txt
b.txt
c.tcl
d.doc
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -tf abcd.tar.gz
a.txt
b.txt
c.tcl
d.doc
```
### (4) 解压缩abcd.tar到/home/lindongyi/Desktop/test
```shell
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -xvf abcd.tar -C /home/lindongyi/Desktop/test
a.txt
b.txt
c.tcl
d.doc
```
### (5) 解压缩abcd.tar.gz文件到/home/lindongyi/Desktop/test/bag
```shell
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -xzf abcd.tar.gz -C /home/lindongyi/Desktop/test/bag
#现在的linux可以智能识别待解压的文件格式，所以解压时不用参数z来指定是.tar.gz文件也可以正常解压
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -xf abcd.tar.gz -C /home/lindongyi/Desktop/test/bag
```
### (6) 向abcd.tar文件的末尾添加一个e.gif文件
```shell
lindongyi@Ubuntu-Workstation:~/Desktop$ tar -rvf abcd.tar e.gif
e.gif
```