#!/bin/sh

if [ -z "${HADOOP_HOME}" ] ; then
	hadoop_version="3.3.0"
	hadoop_path="/opt/hadoop/${hadoop_version}"

	if [ -x "${hadoop_path}/bin/hadoop" ] ; then
		HADOOP_HOME=${hadoop_path} ; export HADOOP_HOME
		PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin/:${PATH} ; export PATH
	fi
	
	unset hadoop_path
	unset hadoop_version
fi
