#!/bin/sh +x

docker run -it --rm --name=data \
  -v $PWD/scripts/:/scripts/ \
  -v $PWD/data/:/data/ \
  --net=v2_geode_cluster \
  pidster/geode-runtime \
  gfsh run --file /scripts/data.gfsh

