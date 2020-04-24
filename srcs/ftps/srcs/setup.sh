#!/bin/sh

apk add openssl vsftpd --no-cache

echo "## Adding user"
mkdir -p /home/vsftpd/admin/
echo "test" > /home/vsftpd/admin/test.txt
adduser -D -h /home/vsftpd/admin admin
chown -R ftp:ftp /home/vsftpd/
chown -R admin /home/vsftpd/admin
echo "admin:password" | chpasswd
echo "admin" >> etc/vsftpd/vsftpd.userlist

#touch /etc/vsftpd/vsftpd.chroot_list
touch /var/log/vsftpd.log

mkdir -p /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -config etc/ssl/private/openssl.conf
