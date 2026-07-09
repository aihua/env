#!/bin/sh

if [ -z "${GOROOT}" ] ; then
    go_version="1.26.0"
    go_root="/opt/go/${go_version}"

    if [ -x "${go_root}/bin/go" ] ; then
        GOROOT="${go_root}" ; export GOROOT
        
        GOPATH="/data/repo/go" ; export GOPATH
        # GOBIN=${GOPATH}/bin ; export GOBIN
        #GOMODCACHE="/data/repo/go" ; export GOMODCACHE

        # GOPROXY="https://goproxy.cn,direct" ; export GOPROXY
        # GOPROXY="https://mirrors.aliyun.com/goproxy/,direct" ; export GOPROXY
        # GO111MODULE="on" ; export GO111MODULE

        PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH} ; export PATH
    fi

    unset go_root
    unset go_version
fi
