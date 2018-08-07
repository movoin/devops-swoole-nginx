#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    1.12.3
#

FROM        movoin/devops-swoole:4
MAINTAINER  Anlewo, Luoyi <luoyi@anlewo.com>

ENV WEB_DOCUMENT_ROOT   /app
ENV WEB_ALIAS_DOMAIN    *.local
ENV WEB_DOCUMENT_INDEX  "index.html index.htm index.php"
ENV WEB_PHP_SOCKET      "127.0.0.1:$SWOOLE_PORT"

COPY conf/ /opt/docker/

RUN set -x \
    && /usr/local/bin/docker-install \
        nginx \
    # Install
    && /opt/docker/bin/install.sh \
    # Bootstrap
    && /opt/docker/bin/bootstrap.sh \
    # Clean up
    && yum clean all

EXPOSE 80
