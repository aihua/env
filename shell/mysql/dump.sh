#!/bin/sh

user=""
password=""
database=""

mysqldump --user=${user} --password=${password} --set-gtid-purged=OFF -ER ${database} > ${database}.sql
