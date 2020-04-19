#!/bin/sh

mkdir -p run/mysqld
mysql_install_db -u root
./setup.sh > /dev/null 2>&1 &
exec /usr/bin/mysqld -u root
