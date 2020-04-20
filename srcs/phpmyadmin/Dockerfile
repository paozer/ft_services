FROM alpine:latest

COPY srcs/setup.sh /tmp/
RUN /tmp/setup.sh && rm /tmp/setup.sh

EXPOSE 5000

# start php built-in server on port 5000 and doc root @ path
ENTRYPOINT ["php", "-S", "0.0.0.0:5000", "-t", "/var/www/localhost/htdocs/phpmyadmin"]
