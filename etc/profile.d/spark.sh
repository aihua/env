#!/bin/sh

if [ -z "${SPARK_HOME}" ] ; then
	spark_version="2.4.0"
	spark_path="/opt/spark/${spark_version}"

	if [ -x "${spark_path}/bin/spark-shell" ] ; then
		SPARK_HOME=${spark_path} ; export SPARK_HOME
		PATH=${SPARK_HOME}/bin:${SPARK_HOME}/sbin/:${PATH} ; export PATH
	fi
	
	unset spark_path
	unset spark_version
fi
