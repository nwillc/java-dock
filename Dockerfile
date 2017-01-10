FROM ubuntu:16.04

EXPOSE 8080
ARG JAR

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install oracle-java8-set-default

RUN mkdir -p /opt/service/logs
VOLUME ["/opt/service/logs"]

ADD $JAR /opt/service/
ADD run.sh /opt/service/
ADD log.properties /opt/service/

ENTRYPOINT ["/opt/service/run.sh"]
CMD ["-p", "8080","-n"]
