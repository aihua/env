#!/bin/sh

if [ -z "${CP_HOME_DIR}" ] ; then
	if [ -x "/usr/local/bin/pod" ] ; then
		CP_HOME_DIR=/data/repo/cocoapod ; export CP_HOME_DIR
	fi
fi
