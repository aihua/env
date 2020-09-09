#!/bin/sh

if [ -z "${PHP_COMPOSER_HOME}" ] ; then
	composer_version="1.8.4"
	composer_path="/opt/composer/${composer_version}"

	if [ -x "${composer_path}/composer" ] ; then
		PHP_COMPOSER_HOME=${composer_path} ; export PHP_COMPOSER_HOME
		PATH=${PHP_COMPOSER_HOME}:${PATH} ; export PATH
	fi
	
	unset composer_path
	unset composer_version
fi
