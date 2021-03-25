# ruoyi-cloud

## 后端结构 com.ruoyi

- ruoyi-ui             		// 前端框架 [80]
- ruoyi-gateway          // 网关模块 [8080]
  - spring-cloud-starter-gateway
  - com.ruoyi.gateway.filter.CacheRequestFilter // 
- ruoyi-auth                // 认证中心 [9200]
- ruoyi-api                  // 接口模块
  - ruoyi-api-system                          // 系统接口
- ruoyi-common         // 通用模块
  - ruoyi-common-core                     // 核心模块
    - pagehelper-spring-boot-starter
    - com.ruoyi.common.core.web.page	// 分页相关
  - ruoyi-common-datascope           // 范围
  - ruoyi-common-datasource          // 数据源
  - ruoyi-common-log                       // 日志记录
  - ruoyi-common-redis                    // 缓存服务
  - ruoyi-common-security               // 安全模块
  - ruoyi-common-swagger              // 系统接口
- ruoyi-modules         // 业务模块
  - ruoyi-system                               // 系统模块 [9201]
    - ruoyi-common-datascope           // 范围
      - ruoyi-common-security               // 安全模块
        - ruoyi-api-system                          // 系统接口
          - ruoyi-common-core                     // 核心模块
            - pagehelper-spring-boot-starter // 分页
              - mybatis-spring-boot-starter
            - web
              - page	// 分页相关
            - utils
              - sql 	// sql检查
  - ruoyi-gen                                    // 代码生成 [9202]
  - ruoyi-job                                     // 定时任务 [9203]
  - ruoyi-file                                     // 文件服务 [9300]
- ruoyi-visual            // 图形化管理模块
  - ruoyi-visual-monitor                  // 监控中心 [9100]
- pom.xml                // 公共依赖

