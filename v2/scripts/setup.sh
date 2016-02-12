#!/bin/sh +x

docker run -it --rm --name=setup \
  -v $PWD/scripts/:/scripts/ \
  -v $PWD/data/:/data/ \
  --net=v2_geode_cluster \
  pidster/geode-runtime \
  gfsh run --file /scripts/setup.gfsh
