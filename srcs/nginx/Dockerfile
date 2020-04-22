FROM alpine:latest

COPY /srcs/index.html /var/www/localhost/htdocs/
COPY /srcs/openssl.conf /etc/ssl/private/
COPY /srcs/sshd_config /etc/ssh/
COPY /srcs/setup.sh /
RUN /setup.sh && rm /setup.sh
COPY /srcs/entrypoint.sh /

EXPOSE 22 80 443

ENTRYPOINT ["/entrypoint.sh"]
