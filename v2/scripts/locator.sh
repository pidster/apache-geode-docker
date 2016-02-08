#!/bin/sh +x

echo "DOMAIN: $HOSTNAME"
NAME=${HOSTNAME%%.*}
echo "HOST  : $NAME"

GEODE_INSTALL="/incubator-geode/gemfire-assembly/build/install/apache-geode"
CLASSPATH="$GEODE_INSTALL/lib/gemfire-core-1.0.0-incubating-SNAPSHOT.jar:$GEODE_INSTALL/lib/gemfire-core-dependencies.jar"

mkdir $NAME
cd $NAME

java -server -classpath $CLASSPATH \
  -Dgemfire.locators=$@ \
  -Dgemfire.enable-cluster-configuration=true \
  -Dgemfire.mcast-port=0 \
  -Dgemfire.load-cluster-configuration-from-dir=false \
  -Dgemfire.jmx-manager-hostname-for-clients=$HOSTNAME \
  -Dgemfire.launcher.registerSignalHandlers=true \
  -Djava.awt.headless=true \
  -Dsun.rmi.dgc.server.gcInterval=9223372036854775806 \
  com.gemstone.gemfire.distributed.LocatorLauncher start $NAME \
  --redirect-output \
  --bind-address=$HOSTNAME \
  --hostname-for-clients=$HOSTNAME \
  --port=10334 

