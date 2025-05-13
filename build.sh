#!/bin/bash

BASE_DIR="$(realpath $(dirname ${BASH_SOURCE[0]}))"
CONTAINER_ENGINE=${CONTAINER_ENGINE:-docker}
IMG_NAME=${1:-'localhost/hugo'}
TAG=${2:-latest}
OS=${OS:-"$(uname -s | tr '[:upper:]' '[:lower:]')"}
IMG_ARCH=${IMG_ARCH:-''}
if [ -z "${IMG_ARCH}" ]; then
    case "$(uname -m)" in
        x86_64)
            IMG_ARCH=amd64
            ;;
        # UNSUPPORTED if platform is not listed here
        *)
            echo "error: platform is unsupported"
            exit 1
            ;;
    esac
fi

if [[ "${TAG}" == "latest" ]]; then
    TAG=$(cat ${BASE_DIR}/build/latest)
fi

if [[ "${TAG}" == "$(cat ${BASE_DIR}/build/latest)" ]]; then
    LATEST_TAG_ARG="--tag ${IMG_NAME}:latest"
fi

CONTAINER_FILE=${BASE_DIR}/build/${TAG}/Containerfile
if [ ! -d ${BASE_DIR}/build/${TAG} ]; then
    echo "error: build file '${CONTAINER_FILE}' for '${TAG}' does not exist"
    exit 1
fi

${CONTAINER_ENGINE} build . --file ${CONTAINER_FILE} \
    --no-cache \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --platform ${OS}/${IMG_ARCH} \
    --tag ${IMG_NAME}:${TAG} ${LATEST_TAG_ARG}
