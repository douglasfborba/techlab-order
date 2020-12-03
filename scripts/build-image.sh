#!/bin/bash

IMAGE_NAME=$(ls $PWD/target/ | grep .jar$ | awk -F "-" '{print $1}')
IMAGE_TAG=$(./scripts/mvn.sh -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)

docker build --no-cache -t $IMAGE_NAME:$IMAGE_TAG -f Dockerfile .