# JVM

[尚硅谷JVM](https://www.bilibili.com/video/BV1PJ411n7xZ)





# JVM下-性能监控与调优

## 二、JVM监控及诊断工具-命令行

### jps

~~~shell
jps -lm
jps -l > a.txt
~~~

## 三、JVM监控及争端工具-GUI

### Arthas

[doc](https://arthas.aliyun.com/doc/)

~~~shell
java -jar arthas-boot.jar
dashboard
// 获得对象的类
System.out.println(proxyObject.getClass());
// 反编译Class成类
jad com.sun.proxy.$Proxy0
~~~

