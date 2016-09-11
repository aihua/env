#!/bin/sh

if [ -z "${STORM_HOME}" ] ; then
	storm_version="1.0.2"
	storm_path="/opt/storm/${storm_version}"

	if [ -x "${storm_path}/bin/storm" ] ; then
		STORM_HOME=${storm_path} ; export STORM_HOME
		PATH=${STORM_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset storm_path
	unset storm_version
fi
