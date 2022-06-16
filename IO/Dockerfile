#!/bin/bash

FROM openjdk:8-jdk-slim
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
RUN apt-get update
RUN apt-get install vim wget zip gettext -y
ENV TOMCAT_VERSION 9.0.38
COPY tomcat.tar.gz .
RUN tar -xf tomcat.tar.gz
RUN mv tomcat/* /opt/tomcat/
RUN rm -rf tomcat.tar.gz tomcat

#creating default directories
RUN bash -c 'mkdir -p /opt/tomcat/TOMCAT_HOME/{conf,log}'
ENV TOMCAT_HOME /opt/tomcat/TOMCAT_HOME
COPY TOMCAT.war /opt/tomcat/webapps/
COPY conf /opt/tomcat/TOMCAT_HOME/conf/

#RUN echo "root:root" | chpasswd
#RUN useradd -ms /bin/bash SUNDEEP -G root -p SUNDEEP@123
#RUN chown -R SUNDEEP:SUNDEEP /opt/
#RUN chmod -R 755 /opt/
#USER SUNDEEP

EXPOSE 8080
CMD ["catalina.sh","run"]
