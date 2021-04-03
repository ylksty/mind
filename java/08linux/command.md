# Command

- [linux-command-manual](https://www.runoob.com/linux/linux-command-manual.html)

## 1、文件管理

### ln

ln 参数 源文件或目录 目标文件或目录

~~~shell
ln /Users/yanglinkai/IdeaProjects/lc-cloud lc-cloud-local
~~~

### awk

### cat

### echo

### scp

scp [可选参数] file_source file_target

~~~shell
scp ruoyi-modules-system-2.5.0.jar joe@121.42.13.150:/home/joe
~~~

## 2、文档编辑

### sed

~~~shell
sed -i '' 1,3d _navbar.md
sed -i '' 's/^\* \([^\[]*[^)]$\)/* [\1](\README\#\1)/' _navbar.md
~~~

### grep

~~~shell
ps -ef|grep activemq|grep -v grep
~~~

### wc

用于计算字数

~~~shell
wc testfile testfile_1 testfile_2
~~~

## 3、文件传输

## 4、磁盘管理

### du

disk usage 显示目录或文件的大小

~~~shell
du -sh ./*
~~~

### df

### disk free 显示目前在 Linux 系统上的文件系统磁盘使用情况统计

~~~shell
df -hT
~~~

## 5、磁盘维护

## 6、网络通讯

### tcpdump

倾倒网络传输数据

### traceroute

显示数据包到主机间的路径

~~~shell
traceroute www.google.com
~~~

### netstat

显示网络状态

~~~shell
netstat -anp|grep 61616
netstat -rn
~~~

### lsof

list open files 列出当前系统打开文件

~~~shell
lsof -i:61616
~~~

### ssh-copy-id

ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.33.11

## 7、系统管理

### ps

process status

~~~shell
ps -ef | grep php | grep -v grep
~~~

### top

实时显示 process 的动态

### uname

显示系统信息

### groupadd

~~~shell
groupadd -g 1024 macrozheng
~~~

### groupdel

~~~shell
groupdel macrozheng
~~~

### useradd

~~~shell
useradd -u 1024 -g macrozheng macro
~~~

### usermod

~~~shell
usermod -g docker macro
~~~

### userdel

~~~shell
userdel macro -r
~~~



## 8、系统设置

## 9、备份压缩

### tar

tape archive

- 解压文件

~~~shell
tar -zxvf abc.tgz
~~~



## 10、yum

Yellow dog Updater, Modified

~~~shell
yum makecache fast
yum list docker-ce --showduplicates
yum install -y xx
yum uninstall -y xx
yum update nginx
yum info nginx*
yum search nginx
~~~

