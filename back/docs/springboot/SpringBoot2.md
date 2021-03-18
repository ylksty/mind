# SpringBoot2

- [bilibili](https://www.bilibili.com/video/BV19K4y1L7MT?p=25)
- [yuque](https://www.yuque.com/atguigu/springboot)

## list

### 基础入门

- Spring生态圈
- SpringBoot的大时代背景
- SpringBoot官方文档架构
- HelloWorld
  - spring-boot-maven-plugin 打包成jar包
- 依赖管理特性
  - spring-boot-starter-parent 父项目，做依赖管理
  - 子项目引用父项目组件，不需要写版本号，引用的项目还是要写的
  - 自动版本仲裁，默认版本号可修改
  - spring-boot-starter-* ： *就某种场景
  - *-spring-boot-starter： 第三方为我们提供的简化开发的场景启动器。
  - 所有场景启动器最底层的依赖：spring-boot-starter
- 自动配置特性
  - spring-boot-starter-web
    - 自动装载Tomcat、SpringMVC、CharacterEncodingFilter、文件上传等组件
  - 默认的包结构
    - 改变扫描路径 @SpringBootApplication(scanBasePackages=**"com.atguigu"**)

### 底层注解

- @Configuration(proxyBeanMethods = true[default])
  - Full模式与Lite模式
    - Full(proxyBeanMethods = true)【保证每个@Bean方法被调用多少次返回的组件都是单实例的】
     *      Lite(proxyBeanMethods = false)【每个@Bean方法被调用多少次返回的组件都是新创建的】
   - Full模式与Lite最佳实战
      - 配置 类组件之间无依赖关系用Lite模式加速容器启动过程，减少判断
      - 配置类组件之间有依赖关系，方法会被调用得到之前单实例组件，用Full模式
- @Import导入组件
  - 把一个类实例化组件，导入容器
- @Conditional条件装配
  - 根据条件，是否导入该组件
- @ImportResources导入Spring配置文件
  - @ImportResource("classpath:beans.xml")
- @ConfigurationProperties(prefix = "mycar") 配置绑定
  - 配置文件值映射到，配置组件，放入容器
  - @EnableConfigurationProperties + @ConfigurationProperties，给第三方类加到容器
  - @Component + @ConfigurationProperties

### 自动配置【源码】

- 自动包规则原理

  - @SpringBootConfiguration

  - @ComponentScan

  - `@EnableAutoConfiguration`

    ~~~java
    @AutoConfigurationPackage // 自动配置包？指定了默认的包规则
    @Import({AutoConfigurationImportSelector.class})
    public @interface EnableAutoConfiguration {}
    ~~~

    - @AutoConfigurationPackage

      ~~~java
      @Import({AutoConfigurationPackages.Registrar.class})
      public @interface AutoConfigurationPackage {}
      //利用Registrar给容器中导入一系列组件
      //将指定的一个包下的所有组件导入进来？MainApplication 所在包下。
      ~~~

    - @Import(AutoConfigurationImportSelector.class) 

      ~~~java
      1、利用getAutoConfigurationEntry(annotationMetadata);给容器中批量导入一些组件
      2、调用List<String> configurations = getCandidateConfigurations(annotationMetadata, attributes)获取到所有需要导入到容器中的配置类
      3、利用工厂加载 Map<String, List<String>> loadSpringFactories(@Nullable ClassLoader classLoader)；得到所有的组件
      4、从META-INF/spring.factories位置来加载一个文件。
          默认扫描我们当前系统里面所有META-INF/spring.factories位置的文件
          spring-boot-autoconfigure-2.3.4.RELEASE.jar包里面也有META-INF/spring.factories
        
      ~~~

- 初始加载自动配置类

  - spring-boot-autoconfigure-2.3.4.RELEASE.jar包里面有META-INF/spring.factories,文件里面写死了spring-boot一启动就要给容器中加载的所有配置类
  - 按需开启自动配置项
    - 虽然我们127个场景的所有自动配置启动的时候默认全部加载。xxxxAutoConfiguration
    - 按照条件装配规则（@Conditional），最终会按需配置。

- 自动配置流程

  - 配置解读

  ~~~java
  @Bean
  @ConditionalOnBean(MultipartResolver.class)  //容器中有这个类型组件
  @ConditionalOnMissingBean(name = DispatcherServlet.MULTIPART_RESOLVER_BEAN_NAME) //容器中没有这个名字multipartResolver 的组件
  public MultipartResolver multipartResolver(MultipartResolver resolver) {
    //给@Bean标注的方法传入了对象参数，这个参数的值就会从容器中找。
    //SpringMVC multipartResolver。防止有些用户配置的文件上传解析器不符合规范
    // Detect if the user has created a MultipartResolver but named it incorrectly
    return resolver;
  }
  给容器中加入了文件上传解析器；
  ~~~

  ~~~java
  @Bean
  @ConditionalOnMissingBean // SpringBoot默认会在底层配好所有的组件。但是如果用户自己配置了以用户的优先
  public CharacterEncodingFilter characterEncodingFilter() {
  }
  ~~~

- 总结
  - SpringBoot先加载所有的自动配置类  xxxxxAutoConfiguration
  - 每个自动配置类按照条件进行生效，默认都会绑定配置文件指定的值。xxxxProperties里面拿。xxxProperties和配置文件进行了绑定
  - 生效的配置类就会给容器中装配很多组件
  - 只要容器中有这些组件，相当于这些功能就有了
  - 定制化配置
    - 用户直接自己@Bean替换底层的组件
    - 用户去看这个组件是获取的配置文件什么值就去修改。

### 最佳实践

- SpringBoot应用如何编写
  - 引入场景依赖 [场景启动器](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-starter)
  - 查看自动配置了哪些（选做）
    - 自己分析，引入场景对应的自动配置一般都生效了
    - 配置文件中debug=true开启自动配置报告。Negative（不生效）\Positive（生效）
  - 是否需要修改
    - 参照文档修改配置项 [common-application-properties](https://docs.spring.io/spring-boot/docs/current/reference/html/appendix-application-properties.html#common-application-properties)
      - 自己分析。xxxxProperties绑定了配置文件的哪些。
    - 自定义加入或者替换组件
      - @Bean、@Component。。。
    - 自定义器  **XXXXXCustomizer**；
- Lombok简化开发
- dev-tools
- Spring Initailizr

### 配置文件

- yaml用法
- 自定义类绑定的配置提示 spring-boot-configuration-processor
  - Generating Your Own Metadata by Using the Annotation Processor
  - [link](https://docs.spring.io/spring-boot/docs/2.3.5.RELEASE/reference/html/appendix-configuration-metadata.html#configuration-metadata-annotation-processor)

### web场景

- 静态资源规则与定制化
- welcome与favicon功能

### 请求处理【源码】

- 静态资源原理
- Rest映射与源码分析
- 怎样改变默认的_method
- 请求映射原理
- 常用参数注解使用
- @RequestAttribute
- @MatrixVariable与UrlPathHelper
- 各种类型参数解析原理
- Servlet Api参数解析原理
- Model、Map原理
- 自定义参数绑定原理
- 自定义converter原理
- ReturnValueHandler原理
- HTTPMessageConverter原理
- 内容协商原理
- 基于请求参数的内容协商原理
- 自定义MessageConverter
- 浏览区与PostMan内容协商完全适配

