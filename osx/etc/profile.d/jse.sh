#!/bin/sh

if [ -z "${JAVA_HOME}" ] ; then
	jse_version="1.8.0_60"
	jse_path=`/usr/libexec/java_home -v $jse_version`

	if [ -x "${jse_path}/bin/java" ] ; then
		JAVA_HOME=${jse_path} ; export JAVA_HOME
		PATH=${JAVA_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset jse_path
	unset jse_version
fi
