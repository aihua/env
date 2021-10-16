#!/bin/sh

if [ -z "${GOPATH}" ] ; then
	go_version="1.17.2"
	go_path="/opt/go/${go_version}"

	if [ -x "${go_path}/bin/go" ] ; then
        GOROOT=${go_path} ; export GOROOT
		GOPATH=/data/repo/go ; export GOPATH
		GOBIN=${go_path}/bin ; export GOBIN
		PATH=${GOROOT}/bin:${GOBIN}:${PATH} ; export PATH
	fi
	
	unset go_path
	unset go_version
fi
