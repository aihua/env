#!/bin/sh

host=""
user=""
password=""
database="demo"
dist="xxx-`date +%y%m%d%H%M%S`.sql"

mysqldump --host="${host}" --user="${user}" --password="${password}" --set-gtid-purged=OFF --add-drop-table --add-drop-trigger --single-transaction -ER ${database} > ${dist}
