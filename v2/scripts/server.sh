#!/bin/sh +x

LOCATORS="v2_locator1_1[10334],v2_locator2_1[10334]"

NAME=${HOSTNAME%%.*}

if [ ! -d /data/$NAME ]; then
  mkdir /data/$NAME
  cd /data/$NAME
fi

echo "Sleeping for 30s because Geode..."
sleep 30

echo "Starting Server ${NAME} with locators ${LOCATORS}"

gfsh start server \
  --name=${NAME} \
  --locators=${LOCATORS} \
  --dir=/data/${NAME}
