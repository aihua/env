#!/bin/sh

if [ -z "${UMLET_HOME}" ] ; then
	umlet_version="14.3.0"
	umlet_path="/opt/umlet/${umlet_version}"

	if [ -x "${umlet_path}/umlet.sh" ] ; then
		UMLET_HOME=${umlet_path} ; export UMLET_HOME
		PATH=${UMLET_HOME}:${PATH} ; export PATH
	fi
	
	unset umlet_path
	unset umlet_version
fi
