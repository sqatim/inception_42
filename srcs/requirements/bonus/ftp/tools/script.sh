#!/bin/sh

echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser $FTP_USER
echo $FTP_USER | tee -a /etc/vsftpd.userlist
mkdir /home/sqatim/wordpress
chown -R sqatim:sqatim /home/sqatim/
chmod 777 /home/sqatim/wordpress
rc-service telegraf start
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf 