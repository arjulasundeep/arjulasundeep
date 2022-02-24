FROM simeio.jfrog.io/docker/io-microservices:8.0.0.0-SNAPSHOT
ENV spring.profiles.active=native,dev
COPY io-audit-service.jar io-audit-service.jar
EXPOSE 8899
ENTRYPOINT ["sh", "-c", "java -jar io-audit-service.jar --spring.config.location=CLASSPATH:/,file:/opt/SIOS_HOME/conf-services/io-audit-service.yml --spring.cloud.bootstrap.location=CLASSPATH:/,file:/opt/SIOS_HOME/conf-services/io-audit-service-bootstrap.yml --spring.profiles.active=dev --logging.config=file:/opt/SIOS_HOME/log4j/io-services-log4j2.xml"]