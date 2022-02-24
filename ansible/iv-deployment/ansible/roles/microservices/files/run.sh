#!/bin/bash

export SIOS_HOME=/home/ivuser/microservices

echo -en "\n-----------------------\n"
echo -en "\nStarting *discovery*...\n"
nohup java -jar ${SIOS_HOME}/jars/discovery-0.1.jar -Dspring.config.location=CLASSPATH:/,file:${SIOS_HOME}/conf-ms/application-discovery.properties -Dlogging.config=file:${SIOS_HOME}/conf-ms/discovery-log4j2-spring.xml >/dev/null 2>&1 &

echo -en "\n-----------------------\n"
echo -en "\nStarting *mfaservice*...\n"
nohup java -jar ${SIOS_HOME}/jars/mfaservice-0.1.jar --spring.config.location=CLASSPATH:/,file:${SIOS_HOME}/conf-ms/application-mfaservice.yml -Dlogging.config=file:${SIOS_HOME}/conf-ms/mfa-log4j2-spring.xml >/dev/null 2>&1 &

echo -en "\n-----------------------\n"
echo -en "\nStarting *database*...\n"
nohup java -jar ${SIOS_HOME}/jars/database-0.1.jar --spring.config.location=CLASSPATH:/,file:${SIOS_HOME}/conf-ms/application-database.properties -Dlogging.config=file:${SIOS_HOME}/conf-ms/database-log4j2-spring.xml >/dev/null 2>&1 &

echo -en "\n-----------------------\n"
echo -en "\nStarting *auditing*...\n"
nohup java -jar ${SIOS_HOME}/jars/auditing-0.1.jar --spring.config.location=CLASSPATH:/,file:${SIOS_HOME}/conf-ms/application-auditing.properties --logging.config=file:${SIOS_HOME}/conf-ms/auditing-log4j2-spring.xml >/dev/null 2>&1 &

echo "running jars"
#while true; do sleep 1000; done
exit 0
