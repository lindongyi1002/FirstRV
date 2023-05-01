## 问题截图
![[nativelink error-couldn‘t execute invalid argument.png]]
## 经排查,是因为在modelsim属性中曾将其设置为以管理员身份运行
![[modelsim_attribute.png]]
## 将"以管理员身份运行此程序"取消即可.