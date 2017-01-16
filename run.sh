
#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

cd ${SCRIPT_DIR}
mkdir logs 2> /dev/null
docker run -d --name java-dock -v $(pwd)/logs:/opt/service/logs -p 8080:8080 nwillc/java-dock