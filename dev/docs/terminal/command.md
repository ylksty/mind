# Command

- [linux-command-manual](https://www.runoob.com/linux/linux-command-manual.html)

## 1、文件管理

### `awk`

### `cat`

### `echo`

### other

- cut
  - 用于显示每行从开头算起 num1 到 num2 的文字
- fmt
  - 用于编排文本文件



## 2、文档编辑

### `sed`

- `sed -i '' 1,3d _navbar.md`

- `sed -i '' 's/^\* \([^\[]*[^)]$\)/* [\1](\README\#\1)/' _navbar.md`

### `grep`

- `ps -ef|grep activemq|grep -v grep`

### `wc`

- `wc testfile testfile_1 testfile_2`

- 用于计算字数

### other

- sort
- uniq
- egrep
- fgrep
- tr
  - 命令用于转换或删除文件中的字符

## 3、文件传输

## 4、磁盘管理

### `du`

- disk usage 显示目录或文件的大小
- `du -sh ./*`

### `df`

- disk free 显示目前在 Linux 系统上的文件系统磁盘使用情况统计

## 5、磁盘维护

## 6、网络通讯

### `lsof`

- list open files 列出当前系统打开文件
- `lsof -i:61616`
- `lsof -i tcp:8080`

### `tcpdump`

- 倾倒网络传输数据

### `traceroute`

- 显示数据包到主机间的路径
- `traceroute www.google.com`

### `netstat`

- 显示网络状态
- `netstat -anp|grep 61616`

### `ssh-copy-id`

> ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.33.11

## 7、系统管理

### `ps`

- process status
- `ps -ef | grep php | grep -v grep`

### `top`

- 实时显示 process 的动态

### `uname`

- 显示系统信息



## 8、系统设置

## 9、备份压缩

### `tar`

- tape archive
- 解压文件
  - tar -zxvf abc.tgz

### unar

- brew install unar
- unzip 我的文件.zip
- unar -encoding GBK 繁體字目錄.zip
- unar -encoding GB\ 18030 繁體字目錄.zip

## 10、yum

- yum makecache fast
- yum list docker-ce --showduplicates
- yum install -y xx
- yum uninstall -y xx

