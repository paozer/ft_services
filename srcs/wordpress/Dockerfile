FROM alpine:latest

COPY srcs/setup.sh /tmp/
RUN /tmp/setup.sh && rm /tmp/setup.sh

EXPOSE 80 5050

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
