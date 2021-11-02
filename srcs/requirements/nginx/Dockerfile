FROM alpine
RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN mkdir /home/tools
RUN mkdir /www
COPY ./conf/nginx.conf ./etc/nginx/
COPY ./tools/script.sh /home/tools/
COPY ./conf/index.html ./www/
EXPOSE 443
WORKDIR  /home/tools
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
RUN chmod +x script.sh
CMD /bin/sh /home/tools/script.sh
