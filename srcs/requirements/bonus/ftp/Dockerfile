FROM alpine
RUN apk update
RUN apk add vsftpd openssl openrc telegraf
COPY ./conf/vsftpd.conf /etc/vsftpd/
RUN	 openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
COPY ./conf/telegraf.conf /etc/
COPY ./tools/script.sh /home/
RUN openrc
RUN touch /run/openrc/softlevel
EXPOSE 21
EXPOSE 20000
CMD /bin/sh /home/script.sh
