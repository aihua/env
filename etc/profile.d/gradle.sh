#!/bin/sh

if [ -z "${GRADLE_HOME}" ] ; then
	gradle_version="2.7"
	gradle_path="/opt/gradle/${gradle_version}"

	if [ -x "${gradle_path}/bin/gradle" ] ; then
		GRADLE_HOME=${gradle_path} ; export GRADLE_HOME
		PATH=${GRADLE_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset gradle_path
	unset gradle_version
fi
