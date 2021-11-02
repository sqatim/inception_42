FROM alpine
RUN apk update
RUN apk add openrc
RUN apk add mariadb mariadb-common mariadb-client
RUN openrc
RUN touch /run/openrc/softlevel
RUN mkdir /home/tools
RUN mkdir /home/conf
COPY ./tools/script.sh  /home/tools/
COPY ./conf/wordpress.sql  /home/conf/
EXPOSE 3306
CMD /bin/sh  /home/tools/script.sh