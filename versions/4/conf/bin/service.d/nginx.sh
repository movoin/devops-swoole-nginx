#!/usr/bin/env bash

source /opt/docker/bin/functions.sh

includeScriptDir "/opt/docker/bin/service.d/nginx.d"

exec /usr/sbin/nginx
