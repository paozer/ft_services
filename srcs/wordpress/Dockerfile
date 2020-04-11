FROM alpine:latest

RUN apk add openrc \
	lighttpd \
	php7 php7-openssl php7-cgi php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib php7-json \
	--no-cache

RUN cd /tmp && wget https://wordpress.org/latest.tar.gz \
	&& tar -xzf latest.tar.gz && mv wordpress /var/www/localhost/htdocs

COPY srcs/wp-config.php /var/www/localhost/htdocs/wordpress
COPY srcs/setup.sh /tmp/setup.sh

EXPOSE 80

ENTRYPOINT sh /tmp/setup.sh && lighttpd -D -f /etc/lighttpd/lighttpd.conf
