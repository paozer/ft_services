apk add lighttpd php7 php-gettext php-session php7-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom --no-cache

# follows phpmyadmin installation guide by alpine linux
mkdir -p /usr/share/webapps/
chmod -R 777 /usr/share/webapps/
cd /usr/share/webapps/
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/

# allows phpmyadmin access to template folder to make it faster
mkdir -p /usr/share/webapps/phpmyadmin/tmp/
chmod 777 /usr/share/webapps/phpmyadmin/tmp/