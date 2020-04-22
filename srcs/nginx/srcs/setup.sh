#!/bin/sh

apk add nginx openssl openssh --no-cache

# NGINX
adduser -D -g www www
chown -R www:www /var/lib/nginx
chown -R www:www var/www/localhost
mkdir -p /run/nginx

# SSL
mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/cert
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/cert/nginx.crt -keyout /etc/ssl/private/nginx.key -config etc/ssl/private/openssl.conf

# SSH
adduser -D admin
echo "admin:password" | chpasswd
mkdir -p /etc/ssh
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssh/ssh_host_rsa_key -keyout /etc/ssh/ssh_host_rsa_key -config etc/ssl/private/openssl.conf
chmod 600 /etc/ssh/ssh_host_rsa_key
