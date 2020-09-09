#!/bin/sh

if [ -z "${PHPLINT_HOME}" ] ; then
	phplint_version="4.0"
	phplint_path="/opt/phplint/${phplint_version}"

	if [ -x "${phplint_path}/phpl" ] ; then
		PHPLINT_HOME=${phplint_path} ; export PHPLINT_HOME
		PATH=${PATH}:${PHPLINT_HOME} ; export PATH
	fi
	
	unset phplint_path
	unset phplint_version
fi
