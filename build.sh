#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

cd ${SCRIPT_DIR}
docker build -t nwillc/java-dock --build-arg JAR=mysnipserver-2.6.6-standalone.jar .