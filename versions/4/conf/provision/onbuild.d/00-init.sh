###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

# Replace default nginx.conf
copyFileTo "$DOCKER_CONF_PATH/etc/nginx/nginx.conf" "/etc/nginx/nginx.conf"

# Enable Nginx main config
copyFileTo "$DOCKER_CONF_PATH/etc/nginx/docker.conf" "/etc/nginx/conf.d/10-docker.conf"

rm -f $DOCKER_CONF_PATH/etc/nginx/nginx.conf $DOCKER_CONF_PATH/etc/nginx/docker.conf
