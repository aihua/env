#!/bin/sh

if [ -z "${FLINK_HOME}" ] ; then
	flink_version="1.11.1"
	flink_path="/opt/flink/${flink_version}"

	if [ -x "${flink_path}/bin/flink" ] ; then
		FLINK_HOME=${flink_path} ; export FLINK_HOME
		PATH=${FLINK_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset flink_path
	unset flink_version
fi
