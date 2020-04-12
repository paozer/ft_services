FROM alpine:latest

RUN apk add mysql mysql-client openrc --no-cache

COPY setup.sh /tmp/setup.sh

ENTRYPOINT sh /tmp/setup.sh
