#!/usr/bin/env bash

SRC_DIR="src"
BUILD_DIR="build"

WD=$(pwd)
IMAGE_NAME="dhdotcom-build-env:latest"

echo "Rebuilding docker image"
# kill container if it's already running
docker build --rm -q -f serve.Dockerfile . -t $IMAGE_NAME
# clean up dangling image, which could happen when dockerfile changes
docker rmi $(docker images -f "dangling=true" -q) > /dev/null 2>&1
echo "Done rebuilding docker image"

sudo rm -rf build
docker run \
  -d -it --rm \
  -v $WD:/docs \
  $IMAGE_NAME \
  sphinx-build -b html $SRC_DIR $BUILD_DIR