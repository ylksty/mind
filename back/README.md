# Back

### SpringBoot启动慢

- InetAddress.getLocalHost().getHostName() took 10012 milliseconds to respond. Please verify your network configuration

- 找主机名卡了

  ~~~bash
  # hostname
  myhostname
  ~~~

- /etc/hosts

  ~~~bash
  127.0.0.1   localhost myhostname
  ::1         localhost myhostname
  ~~~

