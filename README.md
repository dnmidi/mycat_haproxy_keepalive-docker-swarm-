### Base On Docker Swarm
1、this will show u about mycat runing in docker and also incloud mycat-ese.
   about mycat detail please look here. [Mycat-doc](https://github.com/MyCATApache/Mycat-doc)
   
   
  
   
2、otherwise show u haproxy & keepalive in docker,attention please haproxy&keepalive dosen't work in docker swarm.
   because we need docker network host ,so we start it signle.
   
#### Start Haproxy&keepalive
【haproxy1】
docker run -it -d --name keepalived_haproxy1 \
-v /opt/haproxy/ha_config/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg \
-v /opt/haproxy/ka_config/keepalived.conf:/etc/keepalived/keepalived.conf \
-p 48800:48800 \
-p 8096:8096 \
-p 8097:8097 \
-e MODE="BIND" \
--restart=always \
--privileged=true \
--net=host \
pelin/haproxy-keepalived


【haproxy2】
docker run -it -d --name keepalived_haproxy2 \
-v /opt/haproxy/ha_config/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg \
-v /opt/haproxy/ka_config/keepalived.conf:/etc/keepalived/keepalived.conf \
-p 48800:48800 \
-p 8096:8096 \
-p 8097:8097 \
-e MODE="BIND" \
--restart=always \
--privileged=true \
--net=host \
pelin/haproxy-keepalived

