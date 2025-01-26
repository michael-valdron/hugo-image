#!/bin/bash

CONTAINER_ENGINE=${CONTAINER_ENGINE:-docker}
TAG=${1:-latest}
OS=${OS:-"$(uname -s | tr '[:upper:]' '[:lower:]')"}
ARCH=${ARCH:-''}
if [ -z "${ARCH}" ]; then
    case "$(uname -m)" in
        x86_64)
            ARCH=amd64
            ;;
        # UNSUPPORTED if platform is not listed here
        *)
            echo "error: platform is unsupported"
            exit 1
            ;;
    esac
fi

${CONTAINER_ENGINE} build . --file Dockerfile \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --platform ${OS}/${ARCH} \
    --tag michaelvaldron/hugo:${TAG}
