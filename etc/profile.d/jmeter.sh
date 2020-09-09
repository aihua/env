#!/bin/sh

if [ -z "${JMETER_HOME}" ] ; then
	jmeter_version="5.3"
	jmeter_path="/opt/jmeter/${jmeter_version}"

	if [ -x "${jmeter_path}/bin/jmeter" ] ; then
		JMETER_HOME=${jmeter_path} ; export JMETER_HOME
		PATH=${JMETER_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset jmeter_path
	unset jmeter_version
fi
