FROM docker.io/library/ubuntu:24.04
RUN apt-get -y update 
RUN apt-get -y upgrade
RUN apt-get -y install openjdk-17-jdk wget
RUN mkdir /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.41/bin/apache-tomcat-10.1.41.tar.gz /tmp/apache-tomcat-10.1.41.tar.gz 
RUN cd /tmp &&  tar xvfz apache-tomcat-10.1.41.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.1.41/* /usr/local/tomcat/
ADD **/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
