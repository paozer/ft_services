#!/bin/sh

mkdir -p /ftps/admin
adduser --home=/ftps/admin -D admin
mkdir -p /ftps/admin/uploads
chmod 777 /ftps/admin/uploads
chown nobody:nogroup /ftps
chmod a-w /ftps

echo "admin:password" | chpasswd
echo "admin" >> etc/vsftpd/vsftpd.userlist

touch /var/log/vsftpd.log

mkdir -p /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -config etc/ssl/private/openssl.conf

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
