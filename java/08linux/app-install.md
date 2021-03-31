## Centos下jdk8 安装

~~~shell
#!/bin/bash
# 第零步 准备 删除旧版本
yum -y update
java --version
yum remove java-1.7.0-openjdk

# 第一步 下载
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u221-linux-x64.rpm

# 第二步 安装
yum localinstall jdk-8u221-linux-x64.rpm

# 第三步 配置环境变量
# 3.1 找到Java安装路径
update-alternatives --config java
# 3.2 设置Java环境变量
vi /etc/profile
# 追加
### java
export JAVA_HOME=/usr/java/default
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar
# 生效
source /etc/profile

# 第四步 验证
java -version
~~~

## Centos下Docker安装

~~~shell
DOCKER_VERTION=docker-ce-18.06.3.ce-3.el7

echo -e "----------------\033[33;1m 1.卸载旧版本 \033[0m"
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

echo -e "----------------\033[33;1m 2.需要的安装包 \033[0m"
yum install -y yum-utils

echo -e "----------------\033[33;1m 3.设置镜像仓库 \033[0m"
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo || true

# 更新索引
yum makecache fast

echo -e "----------------\033[33;1m 4.安装 docker-ce \033[0m"
# yum list docker-ce --showduplicates | sort -r
yum -y install $DOCKER_VERTION
cat > /etc/docker/daemon.json << EOF
{
    "registry-mirrors":[
        "https://fxr1fpno.mirror.aliyuncs.com"
    ]
}
EOF

systemctl daemon-reload
systemctl start docker
systemctl enable docker

echo -e "----------------\033[33;1m 安装完成 启动完成 \033[0m"
~~~

## centos下安装docker-compose

~~~shell
# 下载最新版本的 docker-compose 到 /usr/bin 目录下
curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose

# 给 docker-compose 授权
chmod +x /usr/bin/docker-compose
~~~

