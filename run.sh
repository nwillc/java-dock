
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

cd ${SCRIPT_DIR}
[ -f config.sh ] && . ./config.sh

mkdir logs 2> /dev/null
docker run -d --name ${CONTAINER} -v $(pwd)/logs:/opt/service/logs -p ${PORT}:${PORT} ${IMAGE}