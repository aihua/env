#!/bin/sh

if [ -z "${RABBITMQ_HOME}" ] ; then
	rabbitmq_version="3.7.14"
	rabbitmq_path="/opt/rabbitmq/${rabbitmq_version}"

	if [ -x "${rabbitmq_path}/sbin/rabbitmq-server" ] ; then
		RABBITMQ_HOME=${rabbitmq_path} ; export RABBITMQ_HOME
		PATH=${RABBITMQ_HOME}/sbin:${PATH} ; export PATH
	fi
	
	unset rabbitmq_path
	unset rabbitmq_version
fi
