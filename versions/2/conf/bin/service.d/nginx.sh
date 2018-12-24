#!/usr/bin/env bash

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/provision.sh"

runInit "nginx.d"

exec /usr/sbin/nginx