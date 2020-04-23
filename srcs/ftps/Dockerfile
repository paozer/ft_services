FROM alpine:latest

COPY srcs/openssl.conf /etc/ssl/private/
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/setup.sh /
RUN /setup.sh && rm -f /setup.sh

EXPOSE 20 21 31100-31105

ENTRYPOINT ["usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
