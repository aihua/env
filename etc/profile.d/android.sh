#!/bin/sh

if [ -z "${ANDROID_HOME}" ] ; then
	android_sdk_version="27.x"
	android_sdk_path="/opt/android/sdk/${android_sdk_version}"

	if [ -x "${android_sdk_path}/tools/android" ] ; then
		ANDROID_HOME=${android_sdk_path} ; export ANDROID_HOME
		PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/tools/proguard/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/27.0.3:${PATH} ; export PATH
	fi
	
	unset android_sdk_path
	unset android_sdk_version
fi
