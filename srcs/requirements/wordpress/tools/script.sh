#!/bin/sh

sed -i "s|;*clear_env*|clear_env|g" /etc/php7/php-fpm.d/www.conf

rc-service php-fpm7 start &>/dev/null
/usr/sbin/php-fpm7 --nodaemonize
