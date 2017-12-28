#!/bin/sh

if [ -z "${GOPATH}" ] ; then
	go_version="1.9.2"
	go_path="/opt/go/${go_version}"

	if [ -x "${go_path}/bin/go" ] ; then
		GOPATH=${go_path} ; export GOPATH
		GOBIN=${go_path}/bin ; export GOBIN
		PATH=${GOPATH}/bin:${PATH} ; export PATH
	fi
	
	unset go_path
	unset go_version
fi
