FROM alpine:latest

ENV TELEGRAF_VERSION 1.14.0

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz /tmp/

RUN cd /tmp && tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/

ENTRYPOINT usr/bin/telegraf;
