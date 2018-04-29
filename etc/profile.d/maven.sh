#!/bin/sh

if [ -z "${M2_HOME}" ] ; then
	maven_version="3.5.3"
	maven_path="/opt/maven/${maven_version}"

	if [ -x "${maven_path}/bin/mvn" ] ; then
		M2_HOME=${maven_path} ; export M2_HOME
		PATH=${M2_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset maven_path
	unset maven_version
fi
