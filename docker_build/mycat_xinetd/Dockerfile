FROM referup/xinetd-mysql

# install java
ADD jdk-8u20-linux-x64.tar.gz /usr/local/
# RUN cd /usr/local && tar -zxvf jdk-8u20-linux-x64.tar.gz && ls -lna

ENV JAVA_HOME /usr/local/jdk1.8.0_20
ENV CLASSPATH ${JAVA_HOME}/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:${JAVA_HOME}/bin

#install mycat
ADD Mycat-server-1.6.5-release-20180122220033-linux.tar.gz /usr/local
# RUN cd /usr/local && tar -zxvf Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz && ls -lna

VOLUME /usr/local/mycat/conf

RUN sed -i '$a\ALL: ALL' /etc/hosts.allow
RUN sed -i '$a\mycat_status 48700/tcp'   /etc/services

EXPOSE 8066 9066 48700

RUN rm -rf /etc/xinetd.d/mysql-redirect

ENTRYPOINT /usr/local/mycat/bin/mycat console