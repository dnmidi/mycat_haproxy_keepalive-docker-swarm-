#!/bin/bash
mycat=`/usr/local/mycat/bin/mycat status | grep 'not running' | wc -l`
if [ "$mycat" = "0" ];
then
   /bin/echo -e "HTTP/1.1 200 OK\r\n"
   exit 0
 else
   /bin/echo -e "HTTP/1.1 503 Service Unavailable\r\n"a
   exit 1
fi