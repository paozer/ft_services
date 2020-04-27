FROM alpine:latest

COPY srcs/setup.sh /
RUN /setup.sh && rm /setup.sh

EXPOSE 5000

# -D don't go to background
ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
