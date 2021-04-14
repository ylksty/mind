# Spring-core

# 基本概念

## Bean

## BeanDefinition

### beanClass

Bean对象的类型

### scope

- singleton-单例Bean
- prototype-原型Bean
- request
- session
- application
- 自定义作用域

### isLazy

是不是一个懒加载的Bean

- 原型-都是懒加载
- 单例Bean
  - 懒加载的Bean在第一次获取时创建
  - 非懒加载在Spring启动的时候创建

- @Lazy

### dependsOn

表示所依赖的其他Bean

- @DependsOn

### autowire

自动装配模式

- list
  - constructor-设计构造方法推断
  - byType-set方法的参数类型
  - byName-set方法的名字
  - no-默认

- 注意和@Autowired注解的区别

### autowireCandidate

当前Bean是不是一个自动装配候选者

- 默认true，能注入给其他Bean

### primary

主Bean，注入时有限被注入

### initMethodName

初始化方法

### destroyMethodName

销毁方法

### constructorArgumentValues

构造方法参数值

### propertyValues

属性值

### factoryBeanName

### factoryMethodName

通过factoryBeanName的factoryMethodName方法，创建一个Bean

## BeanFactory

### BeanDefinitionRegistry

管理BeanDefinition

### SingletonBeanRegistry

管理单例Bean

### ListableBeanFactory

加强BeanFactory，获取所有BeanDefinition的beanNames，根据类型获取beanNames，根据类型获取Bean

### ConfigurableBeanFactory

HierarchicalBeanFactory和SingletonBeanRegistry基础上加强，支持父BeanFactory、类加载器、EL表达式、类型转化、BeanPostProcessor、合并BeanDefinition、销毁Bean等

### AutowireCapableBeanFactory

支持Bean自动装配

### AbstractBeanFactory

实现了ConfigurableBeanFactory接口，继承了FactoryBeanRegistrySupport，但不能自动装配和获取beanNames

### ConfigurableListableBeanFactory

### AbstractAutowireCapableBeanFactory

### DefaultListableBeanFactory

主要实现类

## ApplicationContext

## BeanPostProcessor

## BeanFactoryPostProcessor

# IOC

## Bean的生命周期

## 依赖注入

## 循环依赖

## 扩展点

# AOP

## JDK动态代理

## Cglib动态代理

## ProxyFactory

# 事务

## 数据库事务

## 隔离级别

## 传播机制

