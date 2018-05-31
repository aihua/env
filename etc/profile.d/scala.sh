#!/bin/sh

if [ -z "${SCALA_HOME}" ] ; then
	scala_version="2.12.6"
	scala_path="/opt/scala/${scala_version}"

	if [ -x "${scala_path}/bin/scala" ] ; then
		SCALA_HOME=${scala_path} ; export SCALA_HOME
		PATH=${SCALA_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset scala_path
	unset scala_version
fi
