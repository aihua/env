#!/bin/sh

if [ -z "${HIVE_HOME}" ] ; then
	hive_version="2.1.1"
	hive_path="/opt/hive/${hive_version}"

	if [ -x "${hive_path}/bin/hive" ] ; then
		HIVE_HOME=${hive_path} ; export HIVE_HOME
		PATH=${HIVE_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset hive_path
	unset hive_version
fi
