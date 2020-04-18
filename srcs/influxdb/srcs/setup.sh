#!/bin/sh

influxd &

sleep 10

echo "CREATE USER $INFLUXDB_ADMIN_USER WITH PASSWORD '$INFLUXDB_ADMIN_PASSWORD' WITH ALL PRIVILEGES" | influx

while true
do
	true
done
