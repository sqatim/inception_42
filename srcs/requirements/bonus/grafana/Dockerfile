FROM alpine
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add libc6-compat
RUN apk add influxdb openrc telegraf
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.10.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.3.10.linux-amd64.tar.gz && \
    rm -rf grafana-7.3.10.linux-amd64.tar.gz && \
    mv grafana-7.3.10 grafana
COPY ./conf/telegraf.conf /etc/
COPY ./tools/script.sh /home/
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./conf/sample.yaml /grafana/conf/provisioning/datasources
WORKDIR /grafana/
EXPOSE 3000
CMD /bin/sh /home/script.sh
