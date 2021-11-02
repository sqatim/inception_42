#!/bin/sh
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ; CREATE DATABASE $MYSQL_DATABASE; \
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES"
mysql -u root < /home/conf/wordpress.sql
mysql -u root -e "alter user 'root'@'localhost' identified by '123456789'"
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

/etc/init.d/mariadb stop

exec /usr/bin/mysqld_safe