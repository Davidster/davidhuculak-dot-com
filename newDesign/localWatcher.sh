#!/usr/bin/env bash

PORT="8081"
SRC_DIR="source"
BUILD_DIR="build"

WD=$(pwd)
SPHINX_IMAGE_HASH=$(docker build -f sphinx.Dockerfile -q .)
RELOAD_IMAGE_HASH=$(docker build -f reload.Dockerfile -q .)

SPHINX_CONTAINER_ID=$(
docker run \
    -it -d --rm -v $WD:/home/python/docs $SPHINX_IMAGE_HASH \
    sh -c "find ./source | entr sphinx-build -b html $SRC_DIR $BUILD_DIR"
)

{ \
  docker logs -f $SPHINX_CONTAINER_ID & \
  docker run \
    -it --rm -v $WD:/workdir -p 127.0.0.1:$PORT:$PORT/tcp $RELOAD_IMAGE_HASH \
    sh -c "reload -w $BUILD_DIR -d $BUILD_DIR -p $PORT"; \
}

docker kill $SPHINX_CONTAINER_ID > /dev/null