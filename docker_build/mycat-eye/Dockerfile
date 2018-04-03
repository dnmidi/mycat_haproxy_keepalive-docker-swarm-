FROM kdvolder/jdk8
WORKDIR /usr/local
ADD mycat-web /usr/local/mycat-web
RUN chmod 777 mycat-web
CMD /usr/local/mycat-web/st.sh
EXPOSE 8082