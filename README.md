# mariadb 10.6 容器镜像

## 使用方法

1. 配置端口，一键快速启动。默认用户名root，密码11111。

![20230521211740](https://img-1252439989.cos.ap-shanghai.myqcloud.com/blog/20230521211740.png)

2. 外挂数据卷，实现数据持久化
   
![20230521211734](https://img-1252439989.cos.ap-shanghai.myqcloud.com/blog/20230521211734.png)

3. 可以修改默认密码

![20230521211823](https://img-1252439989.cos.ap-shanghai.myqcloud.com/blog/20230521211823.png)

4. 如外挂数据卷中，已新建数据库，重新run容器时，默认会跳过数据初始化步骤。只需指定外挂目录和映射端口即可启动。