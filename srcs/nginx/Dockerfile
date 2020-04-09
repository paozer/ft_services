FROM alpine:latest

RUN apk add openrc nginx --no-cache
RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY www/index.html /var/www/localhost/htdocs/index.html

EXPOSE 80 443

ENTRYPOINT nginx;
