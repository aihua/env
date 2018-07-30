#!/bin/sh

if [ -z "${ERLANG_HOME}" ] ; then
	erlang_version="21.0"
	erlang_path="/opt/erlang/${erlang_version}"

	if [ -x "${erlang_path}/bin/erl" ] ; then
		ERLANG_HOME=${erlang_path} ; export ERLANG_HOME
		PATH=${ERLANG_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset erlang_path
	unset erlang_version
fi
