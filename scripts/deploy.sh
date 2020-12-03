#!/bin/bash

SERVER=172.31.19.160
IMAGE_NAME=$(ls $PWD/target/ | grep .jar$ | awk -F "-" '{print $1}')
IMAGE_TAG=$(./scripts/mvn.sh -q -Dexec.executable=echo -Dexec.args='${project.version}' --non-recursive exec:exec)

scp -i /tmp/douglas-techlab-app.pem ./scripts/publish.sh ec2-user@$SERVER:/tmp/publish.sh
ssh -i /tmp/douglas-techlab-app.pem ec2-user@$SERVER "sh /tmp/publish.sh $APP_TOKEN $IMAGE_NAME $IMAGE_TAG"