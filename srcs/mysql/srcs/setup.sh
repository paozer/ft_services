#!/bin/sh

mysqladmin status

until [ $? = 0 ]
do
	echo "waiting for mysqld"
	sleep 1
	mysqladmin status
done

echo   "CREATE DATABASE wordpress;
		ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
		CREATE USER 'root'@'%' IDENTIFIED BY 'password';
        GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
		CREATE USER 'wp-admin'@'%' IDENTIFIED BY 'password';
        GRANT ALL PRIVILEGES ON wordpress.* TO 'wp-admin'@'%' WITH GRANT OPTION;
        DROP DATABASE test;
        FLUSH PRIVILEGES;" > tmpfile

/usr/bin/mysql < tmpfile
/usr/bin/mysql wordpress < /wp.sql
rm -f tmpfile
rm -f /wp.sql
rm -- "$0"
