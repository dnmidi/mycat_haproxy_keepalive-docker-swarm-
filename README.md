## Base On Docker Swarm
 This will show u about mycat running in docker and also include mycat-ese. about mycat detail please look here. [Mycat-doc](https://github.com/MyCATApache/Mycat-doc)
  
  Otherwise show u haproxy & keepalive in docker,attention please haproxy&keepalive dosen't work in docker swarm.because it need docker network host model,so we start it signle.
  
  Mycat container also install xinetd to listen mycat status,unfortunately we need start it everytime when the container started.(Someone help me to fix it??)
   " service xinetd start "
  
  Include the hash sharding in mycat,please look mycat configs
  
   ### Start Haproxy&keepalive
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

 ### Add a network in docker swarm
     #docker network create -d overlay --attachable mysql
     
 ### Start mycat in docker swarm
     Mysql_docker_compose.yml
 
 ### Open mycat-eye and cofing
     1.Open  http://yourip:8082/
     
     2.Config zookeeper because we start in the same network,here just type zoo1 instead ip address.
     
     3.Add vip address, about detail please look the keeaplive config


