if [[ ! -e "$WEB_DOCUMENT_ROOT" ]]; then
	echo ""
	echo "[WARNING] WEB_DOCUMENT_ROOT does not exists with path \"$WEB_DOCUMENT_ROOT\"!"
	echo ""
fi

###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

if [ ! -d "$DOCKER_CONF_PATH/.cache/nginx" ];then
	mkdir -p $DOCKER_CONF_PATH/.cache/nginx
	# Backup
	cp $DOCKER_CONF_PATH/etc/nginx/*.conf $DOCKER_CONF_PATH/.cache/nginx
else
	cp -f $DOCKER_CONF_PATH/.cache/nginx/*.conf $DOCKER_CONF_PATH/etc/nginx/
fi

# Replace markers
replaceFile "<DOCUMENT_INDEX>"		"$WEB_DOCUMENT_INDEX" 	"$DOCKER_CONF_PATH/etc/nginx"
replaceFile "<DOCUMENT_ROOT>"		"$WEB_DOCUMENT_ROOT" 	"$DOCKER_CONF_PATH/etc/nginx"
replaceFile "<ALIAS_DOMAIN>"		"$WEB_ALIAS_DOMAIN" 	"$DOCKER_CONF_PATH/etc/nginx"
replaceFile "<SERVERNAME>"			"$HOSTNAME" 			"$DOCKER_CONF_PATH/etc/nginx"
replaceFile "<DOCKER_CONF_PATH>"	"$DOCKER_CONF_PATH" 	"$DOCKER_CONF_PATH/etc/nginx"

if [[ -n "${WEB_PHP_SOCKET+x}" ]]; then
	## WEB_PHP_SOCKET is set
	replaceFile "<PHP_SOCKET>" "$WEB_PHP_SOCKET" 		"$DOCKER_CONF_PATH/etc/nginx"
else
	## WEB_PHP_SOCKET is not set, remove PHP files
	rm $DOCKER_CONF_PATH/etc/nginx/conf.d/10-php.conf
	rm $DOCKER_CONF_PATH/etc/nginx/vhost.common.d/10-php.conf
fi
