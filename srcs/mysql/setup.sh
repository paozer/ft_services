mkdir -p run/mysql
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --user=mysql --datadir=/var/lib/mysql

openrc
touch /run/openrc/softlevel
rc-service mariadb start

db_name='db_wordpress'
user_name='admin'
user_pw='password'
host='localhost'
commands="CREATE DATABASE \`${db_name}\`;
			CREATE USER '${user_name}'@'${host}' IDENTIFIED BY '${user_pw}';
			GRANT USAGE ON *.* TO '${user_name}'@'${host}' IDENTIFIED BY '${user_pw}';
			GRANT ALL privileges ON \`${db_name}\`.* TO '${user_name}'@'${host}';
			FLUSH PRIVILEGES;"

echo "${commands}" | /usr/bin/mysql

rc-service mariadb restart

while true
do
	true
done
