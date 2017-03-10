FROM anapsix/alpine-java:8

ARG PORT
ARG JAR

EXPOSE $PORT

RUN apk update
RUN apk add tini

RUN mkdir -p /opt/service/logs
VOLUME ["/opt/service/logs"]

ADD $JAR /opt/service/
ADD start-service.sh /opt/service/
ADD log.properties /opt/service/

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/opt/service/start-service.sh", "-p", $PORT, "-n"]

