## Q1 使用git clone 克隆github上新建的项目时, 遇到fatal: unable to access 'https://github.com/lindongyi1002/Array_img_show.git': Failed to connect to github.com port 443 after 21070 ms: Timed out
可能由于国内访问github就容易失效;
* 解决办法: 
    1. 挂个梯子;
    2. 在git bash中分别输入如下两段代码:
    ```bash
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    ```
- 两种方式依次尝试, 一般第一步有效.

## Q2 在git bash中由本地向github push文件时提示fatal: unable to access 'https://github.com/lindongyi1002/Array_img_show.git/': Failed to connect to github.com port 443 after 21123 ms: Timed out
同样是网络原因, 如果梯子速度不够快, 可以将要上传的文件分两次或多次push, 减轻上传压力.