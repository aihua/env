#!/bin/sh

user=""
password=""
database=""

mysql --user=${user} --password=${password} ${database}  < ${database}.sql > ${database}.log 2>&1
