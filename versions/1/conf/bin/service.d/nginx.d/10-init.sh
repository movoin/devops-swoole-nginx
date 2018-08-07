if [[ ! -e "$WEB_DOCUMENT_ROOT" ]]; then
    echo ""
    echo "[WARNING] WEB_DOCUMENT_ROOT does not exists with path \"$WEB_DOCUMENT_ROOT\"!"
    echo ""
fi

function replaceNginxConfs()
{
	find /opt/docker/etc/nginx/ -iname '*.conf' -print0 | xargs -0 -r docker-replace --quiet "${1}" "${2}"
}

if [ ! -d "/opt/docker/.cache/nginx" ];then
	mkdir -p /opt/docker/.cache/nginx
	# Backup
	cp /opt/docker/etc/nginx/*.conf /opt/docker/.cache/nginx
else
	cp -f /opt/docker/.cache/nginx/*.conf /opt/docker/etc/nginx/
fi

# Replace markers
replaceNginxConfs "<DOCUMENT_INDEX>" "$WEB_DOCUMENT_INDEX"
replaceNginxConfs "<DOCUMENT_ROOT>"  "$WEB_DOCUMENT_ROOT"
replaceNginxConfs "<ALIAS_DOMAIN>"   "$WEB_ALIAS_DOMAIN"
replaceNginxConfs "<SERVERNAME>"     "$HOSTNAME"

if [[ -n "${WEB_PHP_SOCKET+x}" ]]; then
    ## WEB_PHP_SOCKET is set
    replaceNginxConfs "<PHP_SOCKET>" "$WEB_PHP_SOCKET"
else
    ## WEB_PHP_SOCKET is not set, remove PHP files
    rm /opt/docker/etc/nginx/conf.d/10-php.conf
    rm /opt/docker/etc/nginx/vhost.common.d/10-php.conf
fi
