#!/usr/bin/env bash

VERSION=`./version.sh`

docker build --build-arg docker_version=${VERSION} -t eth_ir:${VERSION} -f Dockerfile .