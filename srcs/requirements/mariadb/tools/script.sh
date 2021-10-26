#!/bin/sh
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root -e "CREATE USER 'sqatim'@'%' IDENTIFIED BY '123456789' ; CREATE DATABASE wordpress; \
GRANT ALL PRIVILEGES ON *.* TO 'sqatim'@'%'; FLUSH PRIVILEGES"

sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

/etc/init.d/mariadb stop

/usr/bin/mysqld_safe