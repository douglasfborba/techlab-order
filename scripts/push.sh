#!/bin/bash

IMAGE_NAME=$(ls $PWD/target/ | grep .jar$ | awk -F "-" '{print $1}')
IMAGE_TAG=$(./scripts/mvn.sh -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)

echo "Registry Authentication"
echo "$JENKINS_TOKEN" | docker login --username $REGISTRY_USERNAME --password-stdin

echo "Image Retaging"
docker tag $IMAGE_NAME:$IMAGE_TAG $REGISTRY_USERNAME/$IMAGE_NAME:$IMAGE_TAG

echo "Pushing image"
docker push $REGISTRY_USERNAME/$IMAGE_NAME:$IMAGE_TAG