#!/bin/sh +x

docker run -it --rm --name=setup \
  -v $PWD/scripts/:/scripts/ \
  -v $PWD/data/:/data/ \
  --net=v2_geode_cluster \
  apachegeode/geode:1.0.0-incubating.M1 \
  gfsh run --file /scripts/setup.gfsh
