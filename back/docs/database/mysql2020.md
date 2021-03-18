# MySQL数据库教程全集（2020）

## 材料

- https://www.bilibili.com/video/BV1xh411Z79d?p=3
- https://www.cs.usfca.edu/~galles/visualization/Algorithms.html

## 知识点

### 索引结构红黑树，Hash，B+树详解

- 红黑树又称平衡二叉树，大量数据导致高度太高，弃用

### 千万级数据表如何用索引快速查找

- B+Tree(B-Tree变种)
- 索引块大小16k
  - SHOW GLOBAL STATUS like 'Innodb_page_size';

### 如何基于索引B+树精准建立高性能索引

