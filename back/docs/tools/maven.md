# Maven

## settings.xml

~~~xml
<mirror>  
  <id>nexus-aliyun</id>  
  <mirrorOf>central</mirrorOf>    
  <name>Nexus aliyun</name>  
  <url>http://maven.aliyun.com/nexus/content/groups/public</url>  
</mirror>
---
<profile>
  <id>jdk-1.8</id>
  <activation>
    <activeByDefault>true</activeByDefault>
    <jdk>1.8</jdk>
  </activation>
  <properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
    <maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
  </properties>
</profile>
~~~

## lookup parent from repository

```xml
<relativePath/> <!-- lookup parent from repository -->
```

