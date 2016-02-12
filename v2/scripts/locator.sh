#!/bin/sh +x

LOCATORS="v2_locator1_1[10334],v2_locator2_1[10334]"

NAME=${HOSTNAME%%.*}

if [ -f /data/${NAME}/vf.gf.locator.pid ]; then
  echo "Removing old pid file"
  rm /data/${NAME}/vf.gf.locator.pid
fi

echo "Starting Locator ${NAME} on port 10334"

cd /data/

gfsh start locator \
  --J="-Dgemfire.jmx-manager-hostname-for-clients=${NAME}" \
  --name=${NAME} \
  --locators=${LOCATORS} \
  --mcast-port=0 \
  --port=10334 \
  --bind-address=${NAME} \
  --max-heap=256m \
  --hostname-for-clients=${NAME}


while true; do
  sleep 10
done

