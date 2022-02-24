#!/bin/sh
SERVICE_NAME=mfa
PATH_TO_JAR=${SIOS_HOME}/jars/mfaservice-0.1.jar
PID_PATH_NAME=${SIOS_HOME}/tmp/mfa.pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            nohup java -jar $PATH_TO_JAR --spring.config.location=CLASSPATH:/,file:${SIOS_HOME}/conf-ms/application-mfaservice.yml -Dlogging.config=file:${SIOS_HOME}/conf-ms/mfa-log4j2-spring.xml >/dev/null 2>&1 &
                        echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
            kill $PID;
            echo "$SERVICE_NAME stopped ...";
            rm $PID_PATH_NAME
            echo "$SERVICE_NAME starting ..."
            nohup java -jar $PATH_TO_JAR --spring.config.location=CLASSPATH:/,file:${SIOS_HOME}/conf-ms/application-mfaservice.yml -Dlogging.config=file:${SIOS_HOME}/conf-ms/mfa-log4j2-spring.xml >/dev/null 2>&1 &
                        echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac