#!/bin/sh

if [ -z "${ZOOKEEPER_HOME}" ] ; then
	zookeeper_version="3.4.9"
	zookeeper_path="/opt/zookeeper/${zookeeper_version}"

	if [ -x "${zookeeper_path}/bin/zkEnv.sh" ] ; then
		ZOOKEEPER_HOME=${zookeeper_path} ; export ZOOKEEPER_HOME
		PATH=${ZOOKEEPER_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset zookeeper_path
	unset zookeeper_version
fi
