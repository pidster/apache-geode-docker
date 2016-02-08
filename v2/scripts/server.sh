#!/bin/sh +x

echo "DOMAIN: $HOSTNAME"
NAME=${HOSTNAME%%.*}
echo "HOST  : $NAME"

mkdir -p /data/$HOSTNAME
cd /data/$HOSTNAME

# gfsh start server --name=$HOSTNAME --locators=locator1[10334],locator2[10334] --dir=/data/$HOSTNAME/ "$@"
#
# while true; do
#     sleep 10
# done

GEODE_INSTALL="/incubator-geode/gemfire-assembly/build/install/apache-geode"
CLASSPATH="$GEODE_INSTALL/lib/gemfire-core-1.0.0-incubating-SNAPSHOT.jar:$GEODE_INSTALL/lib/gemfire-core-dependencies.jar"

java -server -classpath $CLASSPATH \
  -XX:OnOutOfMemoryError='kill -KILL %p' \
  -Dgemfire.locators=locator1[10334],locator2[10334] \
  -Dgemfire.use-cluster-configuration=true \
  -Dgemfire.launcher.registerSignalHandlers=true \
  -Djava.awt.headless=true \
  -Dsun.rmi.dgc.server.gcInterval=9223372036854775806 \
  com.gemstone.gemfire.distributed.ServerLauncher start $NAME \
  --server-port=40404