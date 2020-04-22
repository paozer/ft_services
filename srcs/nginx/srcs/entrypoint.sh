#!/bin/sh

/usr/sbin/sshd
exec /usr/sbin/nginx -c /etc/nginx/nginx.conf
