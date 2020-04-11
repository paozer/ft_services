sed -i 's/\/run\/lighttpd.pid/\/run\/lighttpd\/php-fast-cgi.socket/g' /etc/lighttpd/lighttpd.conf
sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf
sed -i 's/usr\/bin\/php-cgi/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

# mkdir -p /var/www/localhost/htdocs/tmp
# chmod 755 /var/www/localhost/htdocs/tmp
# chmod 755 -R /var/www/localhost/htdocs/*

mkdir -p /var/run/lighttpd
touch /var/run/lighttpd/php-fastcgi.socket
chown -R lighttpd:lighttpd /var/run/lighttpd
