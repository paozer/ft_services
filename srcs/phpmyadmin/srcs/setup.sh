#!/bin/sh

PMA_VERSION=5.0.2

apk add lighttpd php7 php-gettext php-session php7-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom --no-cache

wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-$PMA_VERSION-all-languages.tar.gz
tar zxf phpMyAdmin-$PMA_VERSION-all-languages.tar.gz
rm phpMyAdmin-$PMA_VERSION-all-languages.tar.gz
mv phpMyAdmin-$PMA_VERSION-all-languages/* /var/www/localhost/htdocs/
rmdir phpMyAdmin-$PMA_VERSION-all-languages

# allows phpmyadmin access to template folder to make it faster
mkdir -p /var/www/localhost/htdocs/tmp/
chmod 777 /var/www/localhost/htdocs/tmp/

# lighttpd setup
sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf
sed -i 's/# server.port          = 81/server.port = 5000/g' /etc/lighttpd/lighttpd.conf
sed -i 's/usr\/bin\/php-cgi/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

mkdir -p /var/run/lighttpd
touch /var/run/lighttpd/php-fastcgi.socket
chown -R lighttpd:lighttpd /var/run/lighttpd