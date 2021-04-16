# JDBC

[尚硅谷JDBC](https://www.bilibili.com/video/BV1eJ411c7rf)



# JDBC编码步骤

## 导入MySQL或者Oracle驱动包

~~~xml
<!-- Mysql驱动包 -->
<dependency>
  <groupId>mysql</groupId>
  <artifactId>mysql-connector-java</artifactId>
</dependency>
~~~

## 装载数据库驱动程序(Driver)

~~~java
com.alibaba.druid.pool.DruidDataSource#resolveDriver
~~~

## 获取到与数据库连接(Connection)

~~~java
com.mysql.cj.jdbc.NonRegisteringDriver#connect(String url, Properties info)
~~~

## 获取可以执行SQL语句的对象(Statement)

```java
com.mysql.cj.jdbc.ConnectionImpl#prepareStatement(String sql, int resultSetType, int resultSetConcurrency)
```

## 填充占位符

```java
com.mysql.cj.jdbc.ClientPreparedStatement#setString
```

## 执行SQL语句(增删改查)

```java
com.mysql.cj.jdbc.ClientPreparedStatement#execute
com.mysql.cj.jdbc.ClientPreparedStatement#executeQuery
```

## 得到执行SQL返回的结果(ResultSet)

```java
com.mysql.cj.jdbc.result.ResultSetImpl#next
com.mysql.cj.jdbc.result.ResultSetImpl#getMetaData
```

## 关闭连接(close资源)

```java
com.mysql.cj.jdbc.StatementImpl#close
com.mysql.cj.jdbc.ConnectionImpl#close
```

# Druid

## 一般用法

```java
DataSource ds = DruidDataSourceFactory.createDataSource(pro);
Connection conn = ds.getConnection();
System.out.println(conn);
```

## 自定义数据库连接池

```java
com.ruoyi.framework.config.DruidConfig#dataSource
```

## 获取到与数据库连接(Connection)

```java
com.alibaba.druid.pool.DruidConnectionHolder#getConnection
```

