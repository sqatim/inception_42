FROM alpine
RUN apk update
RUN apk add openrc
RUN apk add mariadb mariadb-common mariadb-client
RUN openrc
RUN touch /run/openrc/softlevel
RUN mkdir ~/tools
COPY ./tools/script.sh ./~/tools/
EXPOSE 3306
CMD /bin/sh /~/tools/script.sh