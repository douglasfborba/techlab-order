#!/bin/bash

APP_TOKEN=$1
IMAGE_NAME=$2
IMAGE_TAG=$3

echo "Docker Hub authenticating..."
echo "$APP_TOKEN" | docker login --username $REGISTRY_USERNAME --password-stdin

if [ ! "$(docker ps -q -f name=$IMAGE_NAME)" ]; then
    
    if [ "$(docker ps -aq -f status=running -f name=$IMAGE_NAME)" ]; then
        echo "Stopping container"
        docker container stop $IMAGE_NAME
    fi

    echo "Starting new container"
    docker run --rm -d --name $IMAGE_NAME -p 8080:8080 $REGISTRY_USERNAME/$IMAGE_NAME:$IMAGE_TAG
fi
