FROM alpine

RUN apk update

RUN apk add redis openrc telegraf
COPY ./conf/redis.conf /etc/
COPY ./conf/telegraf.conf /etc/
COPY ./tools/script.sh /home/
COPY ./conf/redis-cache /redis-cache
# COPY ./conf/redis-cache /www/wordpress/wp-content/plugins/redis-cache
# COPY ./conf/object-cache.php /www/wordpress/wp-content/plugins/
COPY ./conf/object-cache.php /
RUN mkdir -p /www
RUN openrc
RUN touch /run/openrc/softlevel
CMD /bin/sh /home/script.sh