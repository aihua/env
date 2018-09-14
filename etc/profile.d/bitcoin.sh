#!/bin/sh

if [ -z "${BITCOIN_HOME}" ] ; then
	bitcoin_version="0.16.2"
	bitcoin_path="/opt/bitcoin/${bitcoin_version}"

	if [ -x "${bitcoin_path}/bin/bitcoind" ] ; then
		BITCOIN_HOME=${bitcoin_path} ; export BITCOIN_HOME
		PATH=${BITCOIN_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset bitcoin_path
	unset bitcoin_version
fi
