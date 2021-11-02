#!/bin/sh

cp -rf /redis-cache /www/wordpress/wp-content/plugins/
cp -rf  /object-cache.php /www/wordpress/wp-content/

rc-service telegraf start
exec redis-server --protected-mode no