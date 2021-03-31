## Redis

> 最佳实践：https://github.com/ylksty/spring-hub/tree/main/boot-redis-cache

### 缓存穿透

- DB没有记录，redis没有存null，导致每次去DB查询
- DB瞬时压力增大，最终导致崩溃
- 解决
  - null结果保存，并加入短暂过期时间

### 缓存雪崩

- 过期时间相同，同时过期，DB压力过大，雪崩
- 解决
  - 加随机过期时间

### 缓存击穿

- 热点数据，刚好失效，查询落到db
- 解决
  - 加锁

### redisson

- [JUC多线程及高并发](docs/backend/java/jdk/juc.md)

- <https://github.com/redisson/redisson/wiki/8.-分布式锁和同步器>

  - 8.1. 可重入锁（Reentrant Lock
    - 30s过期，默认看门口，10s续签

  - 8.2. 公平锁（Fair Lock）
    - 先后排序
  - 8.3. 联锁（MultiLock）
    - 全部拿到，才解除阻塞
  - 8.4. 红锁（RedLock）
    - 拿到大部分，解除阻塞
  - 8.5. 读写锁（ReadWriteLock）
    - 正在写时读等待，保证读到最新
    - 有写时后面都会阻塞
  - 8.6. 信号量（Semaphore）
    - 车库停车
  - 8.7. 可过期性信号量（PermitExpirableSemaphore）
  - 8.8. 闭锁（CountDownLatch）
    - 班级门卫锁门

### Redis在项目中的使用场景

- String
  - 功能
    - 递增
    - 长度获取
  - 场景
    - 分布式锁
    - 缓存数据
    - 点赞数量
- Hash
  - 功能
    - HSET key field value
  - 场景
    - 购物车早期
- List
  - 场景
    - 微信文章订阅，公众号
    - 秒杀
- Set
  - 功能
    - 排重
    - 基础：添加、删除、所有、查询是否存在、个数
    - 随机取出，不删除或删除
    - 集合：并集、交集
  - 场景
    - 抽奖小程序
      - 随机抽奖，并删除已抽奖的人
    - 朋友圈点赞
      - 点赞或取消，是否点赞，点赞数量
    - 社交关系
      - 共同关注的人，交集
      - 关注的人关注其他人
    - 内推可能认识的人
- Zset
  - 功能
    - 以某一个条件为权重，排序
    - 有序集合，添加一个元素和分数
    - 按分数从小到大返回索引
    - 获取元素分数
    - 指定删除元素、按排名范围删除
    - 获取分数范围元素、及个数、及排名正序倒序
    - 增加元素分数
    - 元素数量
  - 场景
    - 销售量排行
    - 抖音热搜