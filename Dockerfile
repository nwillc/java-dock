FROM openjdk:8-jdk-alpine

EXPOSE 8080
ARG JAR

RUN apk update
RUN apk add bash

RUN mkdir -p /opt/service/logs
VOLUME ["/opt/service/logs"]

ADD $JAR /opt/service/
ADD start-service.sh /opt/service/
ADD log.properties /opt/service/

ENTRYPOINT ["/opt/service/start-service.sh"]
CMD ["-p", "8080", "-n"]
