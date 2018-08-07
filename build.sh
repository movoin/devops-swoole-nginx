#!/usr/bin/env bash
#
# Usage:
#   build.sh movoin/devops-swoole-nginx 1
#

BASE_PATH=$(pwd)
DOCKERFILE_PATH="${BASE_PATH}/versions"

REPO_NAME=$1
TAG_NAME=$2

echo ""
echo "Building image: '${REPO_NAME}:${TAG_NAME}'"
echo ""

######

echo "> Running docker"

echo ""

docker build -t "${REPO_NAME}:${TAG_NAME}" ${DOCKERFILE_PATH}/${TAG_NAME}

echo ""

