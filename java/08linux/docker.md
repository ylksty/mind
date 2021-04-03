# Docker

## Docker安装

- [Centos下Docker安装](../java/08linux/app-install?id=Centos下Docker安装)
- [centos下安装docker-compose](../java/08linux/app-install?id=centos下安装docker-compose)

## Docker镜像常用命令

### 搜索镜像

~~~bash
docker search java
~~~

### 下载镜像

~~~shell
docker pull java:8
~~~

### 列出镜像

```shell
docker images
```

### 删除进行

```shell
docker rmi java:8
docker rmi -f java:8
# 删除没有引用的镜像
docker rmi `docker images | grep none | awk '{print $3}'`
# 删除所有
docker rmi -f $(docker images)
```

### 打包镜像

```shell
# -t 表示指定镜像仓库名称/镜像名称:镜像标签 .表示使用当前目录下的Dockerfile文件
docker build -t mall/mall-admin:1.0-SNAPSHOT .
```

### 推送镜像

```shell
# 登录Docker Hub
docker login
# 给本地镜像打标签为远程仓库名称
docker tag mall/mall-admin:1.0-SNAPSHOT macrodocker/mall-admin:1.0-SNAPSHOT
# 推送到远程仓库
docker push macrodocker/mall-admin:1.0-SNAPSHOT
```

## Docker容器常用命令

### 新建并启动

```shell
docker run -p 80:80 --name nginx \
-e TZ="Asia/Shanghai" \
-v /mydata/nginx/html:/usr/share/nginx/html \
-d nginx:1.17.0
```

### 列出容器

```shell
docker ps
docker ps -a
```

### 停止容器

```shell
docker stop nginx
docker stop c5f5d5125587
docker kill $ContainerName
```

### 启动容器

```shell
docker start xxx
```

### 进入容器

```shell
docker exec -it 243c32535da7 /bin/bash
# 使用root账号进入容器内部
docker exec -it --user root $ContainerName /bin/bash
```

### 删除容器

```shell
docker rm $ContainerName
docker rm `docker ps -a | grep mall-* | awk '{print $1}'`
# 删除所有
docker rm -f $(docker ps -a -q)
```

### 查看容器日志

```shell
docker logs $ContainerName
```

### 将容器启动方式改为always

```shell
docker container update --restart=always $ContainerName
```

### 同步宿主时间到容器

```shell
docker cp /etc/localtime $ContainerName:/etc/
```

### 查看容器资源占用情况

```shell
docker stats $ContainerName
docker stats -a
```

### 查看容器磁盘使用情况

```shell
docker system df
```

### 查看所有网络

```shell
docker network ls
```

### 创建外部网络

```shell
docker network create -d bridge my-bridge-network
```

### 指定容器网络

```shell
docker run -p 80:80 --name nginx \
--network my-bridge-network \
-d nginx:1.17.0
```

### link的使用

```shell
docker run -p 80:80 --name nginx \
--link=mysql_server:db \
-d nginx:1.17.0
## /etc/host
172.17.0.2  db b5e097fe510d mysql_server
```

### Docker容器清理

```shell
# 删除所有关闭的容器
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
# 删除所有dangling镜像(没有Tag的镜像)：
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
# 删除所有dangling数据卷(即无用的 volume)：
docker volume rm $(docker volume ls -qf dangling=true)
```

## Dockerfile常用命令

```shell
# 基础镜像
FROM java:8
# 维护者的名字
MAINTAINER yanglk
# 复制
ADD mall-tiny-docker-file-0.0.1-SNAPSHOT.jar /mall-tiny-docker-file.jar
# 运行过程中创建一个mall-tiny-docker-file.jar文件
RUN bash -c 'touch /mall-tiny-docker-file.jar'
# 声明服务运行在8080端口
EXPOSE 8080
# 指定docker容器启动时运行jar包
ENTRYPOINT ["java", "-jar","/mall-tiny-docker-file.jar"]
```

## Issue

### Docker使用link建立容器之间的连接



### springboot镜像精简

- distroless vs alpine











































