#!/bin/bash

docker run --rm -v $PWD:/app -v /root/.m2:/root/.m2 -w /app maven:3-alpine mvn "$@"
