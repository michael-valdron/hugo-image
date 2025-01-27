#!/bin/bash

BASE_DIR="$(realpath $(dirname ${BASH_SOURCE[0]}))"
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

CONTAINER_FILE=${BASE_DIR}/build/latest/Containerfile
if [ -d ${BASE_DIR}/build/${TAG} ]; then
    CONTAINER_FILE=${BASE_DIR}/build/${TAG}/Containerfile
fi

echo "DEBUG: Base Dir: ${BASE_DIR}"
echo "DEBUG: Does Base Dir exist: $(if [ -d ${BASE_DIR} ]; then echo "true"; else echo "false"; fi)"
echo "DEBUG: Containerfile Path: ${CONTAINER_FILE}"

${CONTAINER_ENGINE} build . --file ${CONTAINER_FILE} \
    --no-cache \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --platform ${OS}/${ARCH} \
    --tag michaelvaldron/hugo:${TAG}
