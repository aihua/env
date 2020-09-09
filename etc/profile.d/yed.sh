#!/bin/sh

if [ -z "${YED_HOME}" ] ; then
	yed_version="3.20"
	yed_path="/opt/yed/${yed_version}"

	if [ -x "${yed_path}/yed" ] ; then
		YED_HOME=${yed_path} ; export YED_HOME
		PATH=${YED_HOME}:${PATH} ; export PATH
	fi
	
	unset yed_path
	unset yed_version
fi
