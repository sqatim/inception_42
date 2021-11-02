FROM alpine
RUN apk update
RUN apk add vsftpd openssl openrc telegraf
COPY ./conf/vsftpd.conf /etc/vsftpd/
# RUN echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | adduser $FTP_USER
# RUN echo $FTP_USER | tee -a /etc/vsftpd.userlist
# RUN echo -e "123456789\n123456789" | adduser sqatim
# RUN echo "sqatim" | tee -a /etc/vsftpd.userlist
RUN	 openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
# RUN mkdir /home/sqatim/wordpress
# RUN chown -R sqatim:sqatim /home/sqatim/
# RUN chmod 777 /home/sqatim/wordpress
COPY ./conf/telegraf.conf /etc/
COPY ./tools/script.sh /home/
RUN openrc
RUN touch /run/openrc/softlevel
EXPOSE 21
CMD /bin/sh /home/script.sh