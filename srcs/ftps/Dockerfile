FROM alpine:latest

RUN apk add openssl vsftpd --no-cache

COPY srcs/openssl.conf /etc/ssl/private/
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY srcs/startup.sh /

EXPOSE 20 21 21100-21104
ENTRYPOINT ["/startup.sh"]
