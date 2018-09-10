#!/bin/sh

if [ -z "${ERLANG_HOME}" ] ; then
	erlang_version="21.0.8"
	erlang_path="/opt/erlang/${erlang_version}"

	if [ -x "${erlang_path}/bin/erl" ] ; then
		ERLANG_HOME=${erlang_path} ; export ERLANG_HOME
		PATH=${ERLANG_HOME}/bin:${PATH} ; export PATH

        ERL_EPMD_ADDRESS=127.0.0.1 ; export ERL_EPMD_ADDRESS
	fi
	
	unset erlang_path
	unset erlang_version
fi
