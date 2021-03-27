## Java设计模式

## 1 其他

> https://www.bilibili.com/video/BV1G4411c7N4?p=3
>
> https://plantuml.com/zh/

### 设计模式有多重要

> 当看源码时，感觉没有方向
>
> 设计模式必须要学，这都是前辈智慧的总结，难道你要从别的源码中总结这些模式吗？
>
> 最佳服用方式，根据文档把测试跑通，画UML，回来看视频

## 2 设计模式的七大原则

### 2.0 设计模式的目的

- 代码重用性
- 可读性
- 可扩展性
- 可靠性（增加新功能，对原来的功能没有影响）
- 高内聚、低耦合

### 2.1 单一职责

1. 一个类只负责一项职责
2. 提高类的可读性，可维护性
3. 降低变更引起的风险
4. 通常应当遵守单一职责原则，只有逻辑足够简单，才可以在代码级违反单一职责原则；只有类中方法数量足够少，才可以在方法级别保持单一职责原则

### 2.2 接口隔离

> Interface Segregation Principle

1. 一个类对另一个类的依赖应该建立在最小的接口上
2. 所谓接口隔离，将功能接口拆分为独立的几个接口，类分别继承接口并重写，被别的类依赖

### 2.3 依赖倒转

> Dependence Inversion Principle

1. 高层模块不应该依赖底层模块，二者都应该依赖其抽象

2. **抽象不应该依赖细节，细节应该依赖抽象**

3. 依赖倒转的核心思想是面向接口编程

4. 依赖倒转原则的设计理念：相对于细节的多变性，抽象的东西要稳定的多。已抽象为基础搭建的架构比以细节为基础的架构要稳定的多。在java中，抽象指的是接口或抽象类，细节就是具体的实现类。

5. 使用接口或抽象类的目的是制定好规范，而不设计任何具体的操作，把展现细节的任务交给他们的实现类去完成

6. 依赖关系传递的三种方式

   1. 接口传递

      ~~~java
      static class OpenAndClose implements IOpenAndClose {
        @Override
        public void open(ITV tv) {
          tv.play();
        }
      }
      interface IOpenAndClose {
        void open(ITV tv);
      }
      ~~~

   2. 构造器传递

      ~~~java
      static class OpenAndClose implements IOpenAndClose {
        public ITV itv;
      
        public OpenAndClose(ITV itv) {
          this.itv = itv;
        }
      
        @Override
        public void open() {
          itv.play();
        }
      }
      interface IOpenAndClose {
        void open();
      }
      ~~~

   3. setter方式传递

      ~~~java
      static class OpenAndClose implements IOpenAndClose {
        public ITV itv;
        @Override
        public void open() {
          itv.play();
        }
      
        @Override
        public void setTv(ITV itv) {
          this.itv = itv;
        }
      }
      interface IOpenAndClose {
        void open();
        void setTv(ITV itv);
      }
      ~~~

7. 注意事项和细节

   1. 底层模块尽量都要有抽象类或接口，或者两者都有，程序稳定性更好
   2. 变量的声明雷翔尽量是抽象类或接口，这样我们的变量应用和实际对象之间，就存在一个缓存层，利于程序扩展和优化
   3. 集成式遵循里式替换原则

### 2.4 里式替换

> Liskov Substitution Principle

1. MIT 1988 姓李女士
2. 所有引用基类的地方必须能透明地使用其子类的对象
3. 使用继承是，尽量不要重写父类的方法
4. 用聚合，组合，依赖，来替换原来的继承
   - 聚合，组合，指原理的父类，通过new父类为，子类的一个属性，来使用原来的父类方法

### 2.5 开闭

> Open Closed Principle

1. （提供方）扩展开放，（使用方）修改关闭。用抽象构建框架，用实现扩展细节
2. 软件变化，通过扩展软件实体的香味来实现变化，而不是通过修改已有的代码来实现变化

### 2.6 迪米特

> Demeter Principle

1. 最少知道原则，对于被依赖的类，不管多复杂，尽量将逻辑封装在类的内部，对外只有public方法
2. 只与直接的朋友通信
3. 概念
   - 朋友关系：即耦合关系，依赖，关联，组合，聚合等
   - 直接的朋友：成员变量，方法参数，方法返回值中的类
   - 非直接朋友：即默认的类，局部变量中的类，最好不要出现

### 2.7 合成复用

> Composite Reuse Principle

1. 尽量使用组合、聚合的方式，而不是使用继承
2. 概念
   1. 聚合 Aggregation setA(A a)
   2. 组合 Composite private A a = new A();

### 2.8 设计原则核心思想

1. 找出应用中可能需要变化之处，把他们独立出来，不要和那些不需要变化的代码混在一起
2. 针对接口编程，而不是针对现实编程
3. 为了交互对象之间的松耦合设计而努力

## 3 UML类图

### 3.1 UML基本介绍

- 软件PlantUML
  - 代码开发画各种图
  - https://plantuml.com/zh/

- UML Unified modeling language 统一建模语言，用户软件系统分析和设计的语言工具，帮助软件开发人员进行思考和记录思路的结果
- UML本身是一套符号的规定

### 3.2 UML图

- 用例图
- 静态结构图：**类图**、对象图、包图、组件图、部署图
- 动态行为图：交互图（时序与协作图）、状态图、活动图
- 说明
  - 类图是描述类与类之间的关系的，是UML图中最核心的

### 3.3 UML类图

- 用户描述系统中的类本身的组成和类之间的各种静态关系
- 类之间的关系：依赖、继承（泛化）、实现、关联、聚合、组合

![Relation.puml](http://www.plantuml.com/plantuml/png/Syv9B2usC5ImqTDJS0QpZHIi55nI2rBpKbBpaYjZyfxic_jYwpGkYAIfWasDhYvKfHbGfNjgNcfHOavcLM99PdvUJDxptSkVTUv_tD3uRFFifpqmRUP0RN0BB83QWbAHz3phM_gqV_7JTVEUzss0QZ1MWDjY0bJkM5oSdvm9LVwqTVEBnYbGXPOA-J2LXWOWbUdfHQdfK9Kl6cSzdT01KMbegA05LmdoetD-Ra5-SMP9AiZHBK1r0000)



### 3.4 依赖关系 Dependence

- 只要在类中用到对方，那么就存在依赖关系

- 类中用到对方、类的成员属性、方法的返回类型、接收的参数类型、方法中使用到


### 3.5 泛化继承 Generalization

- 依赖关系的特例

### 3.6 实现关系 Implementation

- 依赖关系的特例

![Dependence-Generalization-Implementation.puml](http://www.plantuml.com/plantuml/png/VPAnIWD148RxVOhjZCXT-YLOQ41IAQHDizcTd2jtkyVU912JW9Q2n2wDQ2DY9u9O2VemciJ7y2wvmriziztmp_Spyyzk7IF62QlNuv1hx4UXBqnK5o5F4ayg7bWU4O8AGw1DY45Bq0Ay0z1WUQXEEIgZlLOKXn21nbL9o0gdHs0JevlSv7MhkS-jTCIyI9svpNWNROCTA05xm3KT4Pe-BouyMSa-KtOIFe3QMYwqRKO7Hicr7W2k1yYRb6IqfH5i03Pjp8TRjKP6gjwmLk0JeWq2jIeuHbPAeQC_tsw-NcQ4_1tNztSBosentt-JcArMhPVoujq4BHT8yoIvQVVZs5WSbM99EnKE6Jtide109nO98U1_7HD2L1PHZmjmRp9ow5zP5kpcMnPm0JAgP0d-sQGnzhmA5qRTNzZHozU7nSNxnzdvulbwVZbpmwEDiUzNshY_jwCNq_lvrTtyyNOvVIBV)



### 3.7 关联关系 Association

- 类与类之间的联系，依赖关系的特例

- 有导航线：即双向关系或单向关系

### 3.8 聚合关系 Aggregation

- **整体和部分的关系**，整体和部分可以分开，关联关系的特例
- 导航性、多重性

### 3.9 组合关系 Composition

- 整体与部分不能分开
- Person和Head不能分开，组合，Person和IDCard可以分开，聚合

![Association-Aggregation-Composition.puml](http://www.plantuml.com/plantuml/png/TL8xJiGm4Erz2dTaaK9w5qYhKB35IXmWZPLOYQNO4yKE3K82YO82n5BGS0bQ4DSXWcFWRx9PGGhF-CrxytEE6gqxHRAiQwdKWsXFIX1PsLAbqehJkgS2QQvRXjTAGScfvY3JTLtthFP-3g83nQsFa1FY2zOhaFWAOVEblCffNn6yERFMOmsZ1ZatfxyhfdquMR9N15y2hz1roEpHcBbpTKYeDsNoryH7Gt0rfSXRq0r2eSSqFVK89liJ5d9yV1btpr_lD-FRXpbdVkpXaF_qiE37QcOxWsPzR5d0e1Z1MnYaOX6It30iw9nfZgtb9kx4JXUtCHES874MUYoydPSMcWZLuiLNGLDhO8Ro53lK_BI5_Bbz7NVtXqod_uSQYhYNZJixDYeB6CdUprB8xyyxAmaiMApsZzI_)



## 4 设计模式概述

### 4.1 掌握设计模式的层次

- 看源码时需要了解设计原理

### 4.2 设计模式介绍

- 模式不是代码，而是某类问题的通用解决方案，设计模式（Design pattern）代表了最佳的实践

- 提高软件的维护性，通用性和扩展性，并降低软件的复杂度

- 《设计模式》 GOF

### 4.3 设计模式类型

- 三种类型，共23种
- 创建型： **单例**、抽象工厂、原型、建造者、**工厂**
- 结构型：适配器、桥接、**装饰**、组合、外观、享元、**代理**
- 行为型：模板方法、命令、访问者、迭代器、**观察者**、中介者、备忘录、解释器（Interpreter）、状态、策略、职责链

## 5 单例设计模式

### 5.1 单例模式介绍

- 采取一定的方法保证在整个的软件系统中，对某个类智能存在一个对象实例，并且该类只提供一个取得其对象实例的静态方法
- 比如Hibernate的SessionFactory

### 5.2 单例模式八种方式

### 5.3 饿汉式（静态常量）

```java
//饿汉式(静态变量)
static class Singleton {
    //1. 构造器私有化, 外部不能new
    private Singleton() {}

    //2.本类内部创建对象实例
    private final static Singleton instance = new Singleton();

    //3. 提供一个公有的静态方法，返回实例对象
    public static Singleton getInstance() {
        return instance;
    }
}
```

### 5.4 饿汉式（静态代码块）

```java
//饿汉式(静态代码块)
static class Singleton {
    //1. 构造器私有化, 外部不能new
    private Singleton() {}

    //2.本类内部创建对象实例
    private  static Singleton instance;

    static { // 在静态代码块中，创建单例对象
        instance = new Singleton();
    }

    //3. 提供一个公有的静态方法，返回实例对象
    public static Singleton getInstance() {
        return instance;
    }
}
```

- 优缺点
  - 优点：写法简单，类装载classloader的时候完成实例化，避免线程同步问题
  - 缺点：没有Lazy Loading，如果未使用，内存浪费
  - 结论：可用，可能内存浪费

### 5.5 ~~懒汉式（线程不安全）~~

```java
static class Singleton {
    private static Singleton instance;

    private Singleton() {}

    //提供一个静态的公有方法，当使用到该方法时，才去创建 instance
    //即懒汉式
    public static Singleton getInstance() {
        if(instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
```

- 优点：Lazy Loading
- 缺点：多线程不安全
- 总结：不用

### 5.6 ~~懒汉式（同步方法）~~

```java
// 懒汉式(线程安全，同步方法)
static class Singleton {
    private static Singleton instance;

    private Singleton() {}

    //提供一个静态的公有方法，加入同步处理的代码，解决线程安全问题
    //即懒汉式
    public static synchronized Singleton getInstance() {
        if(instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
```

- 优点：解决多线安全
- 缺点：方法进行同步，效率太低
- 总结：不用

### 5.7 ~~懒汉式（同步代码块）~~

```java
    // 懒汉式(线程都不安全，同步代码块)
    static class Singleton {
        private static Singleton instance;

        private Singleton() {}

        public static Singleton getInstance() {
            if(instance == null) {
              	// 多个线程进到这里
                synchronized (Singleton.class) {
                    instance = new Singleton();
                }
            }
            return instance;
        }
    }
```

- 错误，不能使用

### 5.8 懒汉式+双重检查

```java
// 懒汉式(线程安全，双重检查)
static class Singleton {
    private static volatile Singleton instance;

    private Singleton() {}

    //提供一个静态的公有方法，加入双重检查代码，解决线程安全问题, 同时解决懒加载问题
    //同时保证了效率, 推荐使用

    public static Singleton getInstance() {
        if(instance == null) {
            synchronized (Singleton.class) {
                if(instance == null) {
                    instance = new Singleton();
                }
            }
        }
        return instance;
    }
}
```

- 优点
  - 线程安全；延迟加载；效率较高
  - Double-Check保证线程安全
- 结论：推荐使用

### 5.9 静态内部类

```java
    // 静态内部类完成， 推荐使用
    static class Singleton {
        //构造器私有化
        private Singleton() {}

        //写一个静态内部类,该类中有一个静态属性 Singleton
        private static class SingletonInstance {
            private static final Singleton INSTANCE = new Singleton();
        }

        //提供一个静态的公有方法，直接返回SingletonInstance.INSTANCE

        public static Singleton getInstance() {

            return SingletonInstance.INSTANCE;
        }
    }
```

- 采用类装载的机制来保证初始化实例时只有一个线程
- 静态内部类在Singleton类被装载时并不会立即实例化，而是在需要实例化时，即调用getInstance方法时，才会装载内部类SinggletonInstance
- 而类的静态属性在第一次加载类的时候初始化，所以在这里，JVM运行时加载类，帮助我们保证了线程的安全性，在类进行初始化时，别的线程是无法进入的

- 优点：避免线程不安全，利用景天内部类特点实现延迟加载，效率高
- 结论：推荐

### 5.10 枚举

```java
//使用枚举，可以实现单例, 推荐
enum Singleton {
    INSTANCE; //属性
    public void sayOK() {
        System.out.println("ok~");
    }
}
```

- JDK1.5添加的枚举来实现单例模式。不仅避免多线程同步，而且还能防止序列化重建新对象
- 结论：推荐

### 5.11 单例模式在JDK应用的源码分析

- java.lang.Runtime 单例模式（饿汉式）

```java
public class Runtime {
    private static Runtime currentRuntime = new Runtime();

    public static Runtime getRuntime() {
        return currentRuntime;
    }

    private Runtime() {
    }
```

### 5.12 单例模式注意事项和细节说明

- 保证了系统内存中该类只存在一个对象，节省了系统资源，对于一些需要平凡创建销毁的对象，使用单例模式可以提高系统性能
- 想实例化一个单例类的时候，必须要记住使用相应的获取对象的方法，而不是new
- 场景：创建对象耗时过多或耗资源过多，重量级对象，但又经常用到的对象、工具类对象、频繁访问数据库或文件的对象（如数据源、session工厂）

## 6 工厂模式

### 6.1 简单工厂模式

> 定义一个创建对象的类，由这个类来封装实例化对象的行为

- 工厂模式的一种，由工厂决定创建出哪一种产品类的实例，是工厂模式家族中最简单实用的模式
- 当我们会用到大量的创建某种、某类某批对象时，会用到工厂模式

![Pizza.puml](http://www.plantuml.com/plantuml/png/VK-xJiD04EplAxOZ4JAMNAP5WWuY9MMQpNdbdE9xQ6-3abWkw2Yf-JyaFWEJio4MWQlsvg6PkTg8X3ZByr2ZavsjRxItkQunngmqM35QfN0TXL4Bd72Oc-CHeL7GlUjc85juygQ4m1IGQJ9Dz0bRutOCw9sC1Nu_-aUI1xGqMGWRLu7hxgbgbKhvjnkYIAa5xOLSsNVg-NicslvDpoa4uajyBrWO6sgwwpPvFWmxarupeQJeePpdadXv2DGFQAAW6Dt2BqTnmV8zwl4BEw_v0nHAZIjbcJ-ZOGPOLKnL5-lTodqylxs_llnhAJu1)

```java
//简单工厂类
public class SimpleFactory {
  //简单工厂模式 也叫 静态工厂模式
  public static Pizza createPizza2(String orderType) {
      Pizza pizza = null;

      System.out.println("使用简单工厂模式2");
      if (orderType.equals("greek")) {
          pizza = new GreekPizza();
          pizza.setName(" 希腊披萨 ");
      } else if (orderType.equals("cheese")) {
          pizza = new CheesePizza();
          pizza.setName(" 奶酪披萨 ");
      } else if (orderType.equals("pepper")) {
          pizza = new PepperPizza();
          pizza.setName("胡椒披萨");
      }

      return pizza;
  }
}
```

- 优点
  - 添加产品，只要修改SimpleFactory，

### 6.2 工厂方法模式

> 定义一个创建对象的抽象方法，由子类决定要实例化的类。工厂方法模式将对象的实例化推迟到子类

- 将披萨项目的实例化功能抽象成抽象方法，在不同的地域订单子类中具体实现

![facgorymethod.puml](http://www.plantuml.com/plantuml/png/hLAxRi904EplAqvA0GXXznGf0bM402dvWUMyCbRyEDqjY63n6-do6Mdv6efyHh3F5hT0WQoukzdPcT6iUsiYRSTXg5F8QPEbWIgoKALWxIXA83QG2G4hImOKoHgNosI_1raAUVwUtiWaUInpoB06XcNBFiXjaKHI6zHWi3zmunfRmGS7r8OueTYnjqMQdntwdjj078HmWLvU9sj4YouOxWZpYCSSNaNnLfUeDPeEgxDfPzVPj8FhrHKM9ce5oflc7QuC0hbyRND5jVN-gR5fzwBIz3rgY35IHUDTUPvjwDiOZtXxJVod9aiO1C_ypxWtzkymbgVZz-_Fbs2XAXuxzRsn9_C7)

- 地域订单子类，决定实例化具体的pizza
- 地域订单子类依赖，地域口味Pizza

```java
public abstract class OrderPizza {
    //定义一个抽象方法，createPizza , 让各个工厂子类自己实现
    abstract Pizza createPizza(String orderType);

    // 构造器
    public OrderPizza() {
        Pizza pizza = null;
        String orderType; // 订购披萨的类型
        do {
            orderType = getType();
            pizza = createPizza(orderType); //抽象方法，由工厂子类完成
            if (pizza == null) {
                System.out.println(" 订购披萨失败 ");
                break;
            }
            //输出pizza 制作过程
            pizza.prepare();
            pizza.bake();
            pizza.cut();
            pizza.box();

        } while (true);
    }
  // 写一个方法，可以获取客户希望订购的披萨种类
    private String getType() {}
}
```

### 6.3 抽象工厂模式

> 定义了一个interface用户创建相关或有依赖关系的对象簇，而无需指明具体的类

- 抽象工厂模式可以将简单工厂模式和工厂方法模式进行整合
- 从设计层面看，抽象工厂模式就是对简单工厂模式的改进（或者称为进一步抽象）
- 将工厂抽象成两层，AbsFactory(抽象工厂)和具体实现的工厂子类。程序员可以根据创建对象类型使用对应的工厂子类。这样将单个的简单工厂类变成了工厂族，更利于代码的维护和扩展

![Absfactory.puml](http://www.plantuml.com/plantuml/png/hL5BJiCm4Dtx59POaAfAiky22OXOe02Lu09ECcqjue_6Bkf7lGOxZi6Mqx3W6AIrejZ9BcqsLcRUlFVcpVNAMcrcQQfh9krQr4cfH5hMp9Yuuco9J1322cEHbPQUwdJETpj6zuGstzMhHIwNL381fy9qtw8Fz4FnYce4pH2YYMkVQWLx3mlbseO0jGd-3TZdHY7or2RaG8WpTFTulm8mu8p1neAiGflJdXLlT0vQ0uuOpRFHgdasGfLB2xXW9T3RmZmq0IlSjcWtMY8mw_oqIIci0D-sEeohdUP2ro10MdCkPvvTahDpc2GtuNa7FJ_96Vtz-Vhx_YITdICekDIWvn6qsxmStVZdYBrL5kvr2tN8Q0ZnykbmJmhXV5RFeOfZBsdIK-fr_m40)

### 6.4工厂模式在JDK-Calendar源码

- java.util.Calendar

### 6.5 工厂模式小结

- 工厂模式的意义
  - 将实例化对象的代码提取出来，放到一个类中统一管理和维护，达到和主项目的依赖关系的解耦。从而提高项目的扩展和维护性
- 三种工厂模式（简单工厂模式、工厂方法模式、抽象工厂模式）
- 设计模式的抽象原则
  - 创建对象实例时，不要直接new类，而是把这个new类的动作放到一个工厂的方法中，并返回。有的书上说，变量不要直接持有具体类的引用
  - 不要让类继承具体类，而是继承抽象类或者是实现interface
  - 不要覆盖基类中已经实现的方法

















































