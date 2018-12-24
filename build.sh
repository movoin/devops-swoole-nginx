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


echo "> Clean up"

echo ""

find ./ -type f | grep .DS_Store | awk '{system("rm -rf "$1)}'

echo ""


######

echo "> Running docker"

echo ""

docker build --no-cache --force-rm -t "${REPO_NAME}:${TAG_NAME}" ${DOCKERFILE_PATH}/${TAG_NAME}

echo ""

