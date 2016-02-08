#!/bin/sh +x

docker run -it --rm --name=gfsh \
  -v $PWD/scripts/:/scripts/ \
  -v $PWD/data/:/data/ \
  --net=v2_geode_cluster \
  geode/runtime:0.1 \
  gfsh
