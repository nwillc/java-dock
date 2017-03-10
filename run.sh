
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

cd ${SCRIPT_DIR}
[ -f config.sh ] && . ./config.sh

mkdir logs 2> /dev/null

docker run -d --name ${CONTAINER} -v $(pwd)/logs:/opt/service/logs -p ${PORT}:${PORT} \
    -e SERVICE_8080_NAME=${CONTAINER} -e SERVICE_8080_ID=${CONTAINER} -e SERVICE_TAGS=dev,rest \
    ${IMAGE}

