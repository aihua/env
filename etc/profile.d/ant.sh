#!/bin/sh

if [ -z "${ANT_HOME}" ] ; then
	ant_version="1.10.8"
	ant_path="/opt/ant/${ant_version}"

	if [ -x "${ant_path}/bin/ant" ] ; then
		ANT_HOME=${ant_path} ; export ANT_HOME
		PATH=${ANT_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset ant_path
	unset ant_version
fi
