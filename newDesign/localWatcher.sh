#!/usr/bin/env bash

# Note: requires npm and npm package 'reload'
# --> npm install -g reload
# TODO: run reload inside of Docker.
# Probably need to expose the 9856 for wss connection
# (see https://github.com/alallier/reload/blob/master/lib/reload.js#L15)

PORT="8081"
SRC_DIR="source"
BUILD_DIR="build"

WD=$(pwd)
SPHINX_IMAGE_HASH=$(docker build -f sphinx.Dockerfile -q .)

SPHINX_CONTAINER_ID=$(
docker run \
    -it -d --rm -v $WD:/home/python/docs $SPHINX_IMAGE_HASH \
    sh -c "find ./source | entr sphinx-build -b html $SRC_DIR $BUILD_DIR"
)

{ docker logs -f $SPHINX_CONTAINER_ID & reload -b -w $BUILD_DIR -d $BUILD_DIR -p $PORT; }

docker kill $SPHINX_CONTAINER_ID > /dev/null