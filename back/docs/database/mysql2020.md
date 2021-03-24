# MySQL数据库教程全集（2020）

## 材料

- https://www.bilibili.com/video/BV1xh411Z79d?p=3
- https://www.cs.usfca.edu/~galles/visualization/Algorithms.html

## 索引结构红黑树，Hash，B+树详解

- 红黑树又称平衡二叉树，大量数据导致高度太高，弃用

## 千万级数据表如何用索引快速查找

- B+Tree(B-Tree变种)
  - 非叶子节点不存储data，只存储索引，可以放更多的索引
  - 叶子节点包含所有索引字段
  - 叶子节点用指针连接，提高区间访问的性能，可以范围查找
- 索引块大小16k
  - SHOW GLOBAL STATUS like 'Innodb_page_size';

## 如何基于索引B+树精准建立高性能索引

- MyISAM 非聚集索引
  - MYI+MYD
- InnoDB 聚集索引

## 联合索引底层数据结构

