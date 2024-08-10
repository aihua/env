#!/bin/sh

host="127.0.0.1"
port="3306"
user=""
password=""
database="demo"
tables=""
dist="xxx-`date +%y%m%d%H%M%S`.sql"

# MySQL 8.x
mysqldump --host="${host}" --port="${port}"  --user="${user}" --password="${password}" --set-gtid-purged=OFF --add-drop-table --add-drop-trigger --single-transaction -ER ${database} ${tables} > ${dist}

# MySQL 5.x
# mysqldump --host="${host}" --port="${port}"  --user="${user}" --password="${password}" --column-statistics=0  --set-gtid-purged=OFF --add-drop-table --add-drop-trigger --single-transaction -ER ${database} ${tables} > ${dist}
