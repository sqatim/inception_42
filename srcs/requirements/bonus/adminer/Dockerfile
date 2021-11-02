FROM alpine

RUN apk update
RUN apk add  php7 php7-fpm php7-common php7-pecl-redis php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN apk add wget telegraf openrc 

RUN wget "http://www.adminer.org/latest.php" -O /index.php

COPY ./conf/telegraf.conf /etc/
COPY ./tools/script.sh /home/
RUN openrc
RUN touch /run/openrc/softlevel

CMD /bin/sh /home/script.sh