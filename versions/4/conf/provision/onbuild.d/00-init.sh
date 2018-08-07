source /opt/docker/bin/functions.sh

# Replace default nginx.conf
copyFileTo "/opt/docker/etc/nginx/nginx.conf" "/etc/nginx/nginx.conf"

# Enable Nginx main config
copyFileTo "/opt/docker/etc/nginx/docker.conf" "/etc/nginx/conf.d/10-docker.conf"

rm -f /opt/docker/etc/nginx/nginx.conf /opt/docker/etc/nginx/docker.conf
