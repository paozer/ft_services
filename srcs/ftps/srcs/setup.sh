#!/bin/sh

apk add openssl vsftpd --no-cache

## add ssh user
#adduser -D ssh_dummy
#echo "ssh_dummy:password" | chpasswd
## create home dir for chroot jail
#mkdir /home/ssh_dummy/ftp
#chown nobody:nogroup /home/ssh_dummy/ftp
#chmod a-w /home/ssh_dummy/ftp
## create files dir for uploading
#mkdir /home/ssh_dummy/ftp/files
#chown ssh_dummy:ssh_dummy /home/ssh_dummy/ftp/files
## add test file
#echo "blablablabla" > /home/ssh_dummy/ftp/files/test.txt
## add user list
#touch etc/vsftpd/vsftpd.userlist
#echo "ssh_dummy" >> etc/vsftpd/vsftpd.userlist

echo "## Adding user"
mkdir -p /ftps/data/admin
echo "test shit" > /ftps/data/admin/test.txt
adduser -D -h /ftps/data admin
chown admin /ftps/data/admin
echo "admin:password" | chpasswd
echo "admin" >> etc/vsftpd/vsftpd.userlist

#touch /etc/vsftpd/vsftpd.chroot_list
#echo "admin" > /etc/vsftpd/vsftpd.userlist
touch /var/log/vsftpd.log

mkdir -p /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -config etc/ssl/private/openssl.conf
