# Nginx

### Reverse Proxy 反向代理

~~~nginx
upstream gmall{
  #server 127.0.0.1:88;
  #server localhost:88;
  #这里必须用ip，上面都不行
  server 192.168.31.155:88;
}
~~~

~~~nginx
location / {
  proxy_set_header Host $host;
  proxy_pass http://gmall;
}
~~~

### Caching Server 缓存服务器

~~~nginx
location /static/ {
  root  /usr/share/nginx/html;
}
~~~



### Forwrad Proxy 转发代理

### Load Balancer 负载均衡

### Firewall 防火墙

### default_server

~~~nginx
server {
   listen 80 default_server;
   server_name _;
   
   return 404;
}
~~~

- 当所有server的规则都不匹配时，nginx会采用第一条server配置，所以一般第一条server会使用阻止页面