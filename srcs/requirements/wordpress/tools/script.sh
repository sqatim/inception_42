#!/bin/sh

if [ $(ls /www/wordpress | wc -l)  -eq 0 ]
then
    mv wordpress/* /www/wordpress/;
    rm -rf wordpress;
else
    rm -rf wordpress;
fi

sed -i "s|;*clear_env*|clear_env|g" /etc/php7/php-fpm.d/www.conf

rc-service php-fpm7 start
exec /usr/sbin/php-fpm7 --nodaemonize
