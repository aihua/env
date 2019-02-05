#!/bin/sh

if [ -z "${HBASE_HOME}" ] ; then
	hbase_version="2.1.2"
	hbase_path="/opt/hbase/${hbase_version}"

	if [ -x "${hbase_path}/bin/hbase" ] ; then
		HBASE_HOME=${hbase_path} ; export HBASE_HOME
		PATH=${HBASE_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset hbase_path
	unset hbase_version
fi
