#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

cd ${SCRIPT_DIR}

[ -f config.sh ] && . ./config.sh

JAR=$(ls *.jar)
FILE=${CONTAINER}.tar
rm -rf ${FILE} ${FILE}.bz2

echo -n "Building ${IMAGE}..."
docker build -t ${IMAGE} --build-arg JAR=${JAR} .
echo -n "Saving to ${FILE}..."
docker save -o ${FILE} ${IMAGE}
echo "Compressing."
bzip2 ${FILE}