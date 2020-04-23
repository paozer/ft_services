FROM alpine:latest

COPY srcs/wordpress.tar.gz /tmp/
COPY srcs/setup.sh /tmp/
RUN /tmp/setup.sh && rm /tmp/setup.sh

EXPOSE 5050

# -D = dont go to background
ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
