#!/bin/sh

if [ -z "${GETH_HOME}" ] ; then
	geth_version="1.9.9"
	geth_path="/opt/geth/${geth_version}"

	if [ -x "${geth_path}/geth" ] ; then
		GETH_HOME=${geth_path} ; export GETH_HOME
		PATH=${GETH_HOME}:${PATH} ; export PATH
	fi
	
	unset geth_path
	unset geth_version
fi
