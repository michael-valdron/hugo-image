#!/bin/bash

CONTAINER_ENGINE=${CONTAINER_ENGINE:-docker}
TAG=${1:-latest}

${CONTAINER_ENGINE} build . --file Dockerfile \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --tag michaelvaldron/hugo:${TAG}
