#!/bin/sh

user=""
password=""
database=""
dist="xxx.sql"

mysqldump --user="${user}" --password="${password}" --set-gtid-purged=OFF -ER ${database} > ${dist}
