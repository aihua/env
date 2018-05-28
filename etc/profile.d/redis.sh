#!/bin/sh

if [ -z "${REDIS_HOME}" ] ; then
	redis_version="4.0.8"
	redis_path="/opt/redis/${redis_version}"

	if [ -x "${redis_path}/bin/redis-server" ] ; then
		REDIS_HOME=${redis_path} ; export REDIS_HOME
		PATH=${REDIS_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset redis_path
	unset redis_version
fi
