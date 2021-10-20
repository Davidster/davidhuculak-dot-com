#!/usr/bin/env bash

PORT="8081"
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

# We start the container in the background and watch it by using the `docker logs` command.
# This allows to workaround the issue where the docker process (watchexec) doesn't listen to 
# SIGINT (Ctrl+C). By killing the container with `docker kill`, we do not need to rely on the docker process
# to handle the SIGINT (instead, we rely on `docker logs` to handle it)
CONTAINER_ID=$(
    docker run \
        -d -it --rm \
        -v $WD:/docs \
        -p 127.0.0.1:$PORT:$PORT/tcp \
        $IMAGE_NAME \
        /root/.cargo/bin/watchexec \
            -r \
            -d 0 \
            -w ./$SRC_DIR \
            "sphinx-build -b html $SRC_DIR $BUILD_DIR && reload -w $BUILD_DIR -d $BUILD_DIR -p $PORT"
)

function cleanup {
  docker kill $CONTAINER_ID > /dev/null
}

trap cleanup EXIT

docker logs -f $CONTAINER_ID