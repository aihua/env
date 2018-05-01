#!/bin/sh

if [ -z "${ANDROID_HOME}" ] ; then
	android_sdk_version="27.x"
	android_sdk_path="/opt/android/sdk/${android_sdk_version}"

	if [ -x "${android_sdk_path}/tools/android" ] ; then
		ANDROID_HOME=${android_sdk_path} ; export ANDROID_HOME
        ANDROID_SDK_ROOT=${ANDROID_HOME} ; export ANDROID_SDK_ROOT
		PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/tools/proguard/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/27.0.3:${PATH} ; export PATH
        ANDROID_EMULATOR_HOME=/data/repo/android ; export ANDROID_EMULATOR_HOME
	fi
	
	unset android_sdk_path
	unset android_sdk_version
fi

if [ -z "${ANDROID_NDK_ROOT}" ] ; then
	android_ndk_version="r16b"
	android_ndk_path="/opt/android/ndk/${android_ndk_version}"

	if [ -x "${android_ndk_path}/ndk-which" ] ; then
		ANDROID_NDK_ROOT=${android_ndk_path} ; export ANDROID_NDK_ROOT
		PATH=${ANDROID_NDK_ROOT}:${PATH} ; export PATH
	fi
	
	unset android_ndk_path
	unset android_ndk_version
fi
