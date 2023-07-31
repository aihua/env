#!/bin/sh

host="127.0.0.1"
port="3306"
user=""
password=""
database=""
src="patch-20180808.sql"

mysql --host="${host}" --port="${port}" --user="${user}" --password="${password}" ${database} <  ${src} > out.log 2>&1
