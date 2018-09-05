#!/bin/sh

host=""
user=""
password=""
database=""
src="patch-20180808.sql"

mysql --host="${host}" --user="${user}" --password="${password}" ${database} <  ${src} > out.log 2>&1
