#!/bin/sh

user=""
password=""
database=""
source="xxx.sql"

mysql --user="${user}" --password="${password}" "${database}"  < ${source} > ${database}.log 2>&1
