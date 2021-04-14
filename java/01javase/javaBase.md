# 视频

[宋红康-尚硅谷](https://www.bilibili.com/video/BV1Kb411W75N)

# Java基础

## 3、数组

## 6、面向对象

## 7、异常处理

## 8、多线程

## 9、常用类

- 注意

~~~java
String s1 = "javaEEhadoop";
final String s4 = "javaEE"; // s4: 常量
String s5 = s4 + "Hadoop";
s1 == s5; // true
~~~



## 10、枚举与注解

## 11、Java集合

### 1.Java集合框架概述

- Collection
  - List：有序、可重复（动态数组，替换原有的数组）
    - ArrayList：数组存储（主要实现；线程不安全，效率高）
    - LinkedList：双向列表（频繁插入删除效率高）
    - Vector：线程安全
  - Set
    - HashSet
      - LinkedHashSet
- Map
  - HashMap
  - LinkedHashMap
- 注意

~~~java
// 数组转集合
List arr1 = Arrays.asList(new int[]{123, 456});
arr1.size(); // 1
List arr2 = Arrays.asList(new Integer[]{123, 456});
arr2.size(); // 2
~~~



### 2.Collection接口方法

equals方法重写

### 3.Iterator迭代器接口

### 4.Collection子接口：List

### 5.Collection子接口：set

### 6.Map接口

### 7.Collection工具类

## 12、泛型 Generic

> https://www.bilibili.com/video/BV1Kb411W75N?p=565

## 13、IO流

## 14、网络编程

## 15、Java反射机制

### 1.Java反射机制概述

### 2.理解Class类并获取Class实例

### 3.类的加载与ClassLoader的理解

### 4.创建运行时类的对象

### 5.获取运行时类的完整结构

### 6.运行时类的指定结构

~~~java
method.invoke(target, args);
~~~

### 7.反射的应用：动态代理

#### 动态代理AOP（Aspect Orient Programming）

~~~java
public interface Dog{
  void info();
  void run();
}

public class HuntingDog implements Dog{
  public void info(){
  System.out.println("我是一只猎狗");
  }
  public void run(){
  System.out.println("我奔跑迅速");
  } 
}

public class DogUtil{
  public void method1(){
  	System.out.println("=====模拟通用方法一=====");
  }
  public void method2(){
  	System.out.println("=====模拟通用方法二=====");
  }
}

public class MyInvocationHandler implements InvocationHandler{
  // 需要被代理的对象
  private Object target;
  public void setTarget(Object target){
  	this.target = target;
  }
  // 执行动态代理对象的所有方法时，都会被替换成执行如下的invoke方法
  public Object invoke(Object proxy, Method method, Object[] args) throws Exception{
    DogUtil du = new DogUtil();
    // 执行DogUtil对象中的method1。
    du.method1();
    // 以target作为主调来执行method方法
    Object result = method.invoke(target, args);
    // 执行DogUtil对象中的method2。
    du.method2();
    return result;
  }
}

public class MyProxyFactory{
  // 为指定target生成动态代理对象
  public static Object getProxy(Object target) throws Exception{
    // 创建一个MyInvokationHandler对象
    MyInvokationHandler handler = new MyInvokationHandler();
    // 为MyInvokationHandler设置target对象
    handler.setTarget(target);
    // 创建、并返回一个动态代理对象
    return Proxy.newProxyInstance(target.getClass().getClassLoader(),
                                  target.getClass().getInterfaces(), handler);
  }
}

public class Test{
  public static void main(String[] args) throws Exception{
    // 创建一个原始的HuntingDog对象，作为target
    Dog target = new HuntingDog();
    // 以指定的target来创建动态代理
    Dog dog = (Dog)MyProxyFactory.getProxy(target);
    dog.info();
    dog.run();
  }
}

~~~



## 16、Java8新特性

### 1.Lambda表达式

~~~java
// 类型推断
Comparator<Integer> com = (x, y) -> Integer.compare(x, y);
// 方法引用
Comparator<Integer> com = Integer::compare;
int compare = com.reversed().compare(1, 2);
System.out.println(compare);
~~~

#### 本质

接口抽象方法的实现逻辑

#### 参数列表的类型推断

### 2.函数式（Functional）接口

#### 什么是函数式(Functional)接口？

只包含一个抽象方法的接口

#### 如何理解函数式接口？

Lambda表达式就是一个函数式接口的实例

匿名实现类都可以用Lambda来代替

#### 四大核心函数式接口

### 3.方法引用与构造器引用

### 4.强大的Steam API

### 5.Optional类