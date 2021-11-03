FROM alpine
RUN apk update
RUN apk add openrc
RUN apk add  php7 php7-fpm php7-common php7-pecl-redis php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir /home/tools
RUN mkdir /www
COPY ./tools/script.sh /home/tools/
COPY ./conf/www.conf ./etc/php7/php-fpm.d/
COPY ./conf/wp-config.php .
WORKDIR  /home/tools
RUN chmod +x script.sh
RUN openrc
RUN touch /run/openrc/softlevel
WORKDIR /
RUN mkdir /www/wordpress
RUN chmod 777 /www/wordpress
RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz && \
    rm wordpress/wp-config-sample.php && \
    mv /wp-config.php wordpress/
EXPOSE 9000
CMD /bin/sh /home/tools/script.sh
