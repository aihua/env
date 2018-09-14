#!/bin/sh

if [ -z "${LITECOIN_HOME}" ] ; then
	litecoin_version="0.16.2"
	litecoin_path="/opt/litecoin/${litecoin_version}"

	if [ -x "${litecoin_path}/bin/litecoind" ] ; then
		LITECOIN_HOME=${litecoin_path} ; export LITECOIN_HOME
		PATH=${LITECOIN_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset litecoin_path
	unset litecoin_version
fi
