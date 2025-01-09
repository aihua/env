#!/bin/sh

if [ -z "${HUGO_HOME}" ] ; then
    # hugo_version="0.127.0"
    hugo_version="0.140.2"
    hugo_path="/opt/hugo/${hugo_version}"

    if [ -x "${hugo_path}/hugo" ] ; then
        HUGO_HOME="${hugo_path}" ; export HUGO_HOME
        
        PATH=${HUGO_HOME}:${PATH} ; export PATH
    fi

    unset hugo_path
    unset hugo_version
fi
