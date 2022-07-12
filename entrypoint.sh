#!/bin/bash

python3 "/lto-node/starter.py"
echo "Node is starting..."
${JAVA_HOME}/bin/java -Dlogback.stdout.level="${LTO_LOG_LEVEL}" "-Xmx${LTO_HEAP_SIZE}" -jar "/lto-node/lto-public-all.jar" $LTO_CONFIG_FILE
