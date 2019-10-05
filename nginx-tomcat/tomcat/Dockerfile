FROM centos:7
RUN yum install -y java
ADD files/apache-tomcat-9.0.6.tar.gz /opt/
RUN sed -i -e "s/\${catalina.base}\/logs/\/share\/logs/g" /opt/apache-tomcat-9.0.6/conf/logging.properties
CMD [ "/opt/apache-tomcat-9.0.6/bin/catalina.sh", "run" ]
