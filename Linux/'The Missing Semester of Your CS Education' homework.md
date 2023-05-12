## 一、课程概览与shell
1. 使用`echo $SHELL`命令可以查看您的 shell 是否满足要求。
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512132815.png)
2. 在 `/tmp` 下新建一个名为 `missing` 的文件夹。
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512132920.png)
3.  用 `man` 查看程序 `touch` 的使用手册。
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512133008.png)
4.  用 `touch` 在 `missing` 文件夹中新建一个叫 `semester` 的文件。
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512133220.png)
5. 将以下内容一行一行地写入 `semester` 文件：
    ```
     #!/bin/sh
     curl --head --silent https://missing.csail.mit.edu
    ```
    - 通过使用'\\'字符让"#", "!"取消转义，也可以通过用单引号包裹字符串将其中的字符"/"取消转义。
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512152048.png)
6.  尝试执行这个文件。
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512190832.png)
该文件无可执行权限x。
7.  查看 `chmod` 的手册(例如，使用 `man chmod` 命令)
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512190921.png)
8.  使用 `chmod` 命令改变权限，使 `./semester` 能够成功执行，不要使用 `sh semester` 来执行该程序。您的 shell 是如何知晓这个文件需要使用 `sh` 来解析呢？更多信息请参考：[shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))    
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512191730.png)
9.  使用 `|` 和 `>` ，将 `semester` 文件输出的最后更改日期信息，写入主目录下的 `last-modified.txt` 的文件中
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512194405.png)
10.  写一段命令来从 `/sys` 中获取笔记本的电量信息，或者台式机 CPU 的温度。
台式电脑linux虚拟机无法获取传感器温度，因此将该部分更换为查看系统内存，并将结果保存至~/meminfo.txt
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512201004.png)
![image.png|800](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/20230512201022.png)
