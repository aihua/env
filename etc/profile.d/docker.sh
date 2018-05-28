#!/bin/sh

if [ -z "${DOCKER_HOME}" ] ; then
	docker_version="17.12.1"
	docker_path="/opt/docker/${docker_version}"

	if [ -x "${docker_path}/docker" ] ; then
		DOCKER_HOME=${docker_path} ; export DOCKER_HOME
		PATH=${DOCKER_HOME}:${PATH} ; export PATH
	fi
	
	unset docker_path
	unset docker_version
fi
