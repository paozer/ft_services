FROM alpine:latest

COPY /srcs/index.html /var/www/localhost/htdocs/
COPY /srcs/self_signed.conf /etc/ssl/private/
COPY /srcs/setup.sh /
RUN /setup.sh && rm /setup.sh

#RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype --no-cache

#COPY conf/www.conf /etc/php7/php-fpm.d/
#COPY www/index.php /var/www/localhost/htdocs/

EXPOSE 80 443

#ENTRYPOINT /usr/sbin/php-fpm7; /usr/sbin/nginx
ENTRYPOINT ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
