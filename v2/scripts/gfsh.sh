#!/bin/sh +x

docker run -it --rm --name=gfsh \
  -v $PWD/scripts/:/scripts/ \
  -v $PWD/data/:/data/ \
  --net=weave \
  apachegeode/geode:1.0.0-incubating.M1 \
  gfsh
