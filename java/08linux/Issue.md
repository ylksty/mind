# 08linux-Issue

## ssh免密登陆

- ssh-keygen

- vi /etc/ssh/sshd_config

  ~~~shell
  # Authentication:
  
  #LoginGraceTime 2m
  PermitRootLogin yes
  StrictModes yes
  #MaxAuthTries 6
  #MaxSessions 10
  
  PubkeyAuthentication yes
  
  PasswordAuthentication yes
  ChallengeResponseAuthentication no
  ~~~

- service sshd restart

- ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.33.10

## kibana和nacos不能双开?

- 原因是内存不足，2G改4G解决

## Vim打开文件中文乱码

- 编辑 ~/.vimrc 文件（没有则手动创建） 添加如下几行

  ~~~shell
   set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
   set termencoding=utf-8
   set encoding=utf-8
  ~~~

  

