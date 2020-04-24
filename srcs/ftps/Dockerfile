FROM alpine:latest

COPY srcs/openssl.conf /etc/ssl/private/
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY srcs/setup.sh /
RUN  /setup.sh && rm -f /setup.sh
COPY srcs/startup.sh /

EXPOSE 20 21 21100-21110
ENTRYPOINT ["/startup.sh"]
