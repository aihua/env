#!/bin/sh

if [ -z "${APKTOOL_HOME}" ] ; then
	apktool_version="2.4.1"
	apktool_path="/opt/apktool/${apktool_version}"

	if [ -x "${apktool_path}/apktool" ] ; then
		APKTOOL_HOME=${apktool_path} ; export APKTOOL_HOME
		PATH=${APKTOOL_HOME}:${PATH} ; export PATH
	fi
	
	unset apktool_path
	unset apktool_version
fi
