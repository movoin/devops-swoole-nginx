#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    18.09.0
#

FROM movoin/devops-swoole:2

ENV WEB_DOCUMENT_ROOT   /app
ENV WEB_ALIAS_DOMAIN    *.local
ENV WEB_DOCUMENT_INDEX  "index.html index.htm index.php"
ENV WEB_PHP_SOCKET      "127.0.0.1:$SWOOLE_PORT"

COPY conf/              $DOCKER_CONF_PATH

RUN set -x \
    && /usr/local/bin/docker-install \
        nginx \
    # Bootstrap
    && $DOCKER_CONF_PATH/bin/bootstrap.sh

EXPOSE 80
