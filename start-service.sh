#!/bin/sh

cd /opt/service

[ -f env.sh ] && source env.sh

JAVA_OPTS="-Djava.awt.headless=true -Dtinylog.configuration=log.properties"

echo Start server...
java ${JAVA_OPTS} -jar *.jar $*
