## 问题截图
![600](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/nativelink%20error-couldn%E2%80%98t%20execute%20invalid%20argument.png)
## 经排查,是因为在modelsim属性中曾将其设置为以管理员身份运行
![](https://picgo-1318211300.cos.ap-beijing.myqcloud.com/FigBed/modelsim_attribute.png)
## 将"以管理员身份运行此程序"取消即可.