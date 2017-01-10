#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

cd ${SCRIPT_DIR}

[ -f env.sh ] && source env.sh

JAVA_OPTS=(-Djava.awt.headless=true -Dtinylog.configuration=log.properties)

echo Start server...
java ${JAVA_OPTS[@]} -jar *.jar $*
