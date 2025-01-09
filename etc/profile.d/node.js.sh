#!/bin/sh

if [ -z "${NODE_JS_HOME}" ] ; then
	# node_js_version="8.17."
	# node_js_version="10.24.1"
	# node_js_version="12.22.12"
	# node_js_version="14.21.3"
	# node_js_version="16.20.2"
	node_js_version="18.20.5"
	# node_js_version="20.18.1"
	# node_js_version=""22.13.0
	node_js_path="/opt/node.js/${node_js_version}"
    node_prefix_path="/System/Volumes/Data/data/repo/node.js/global"

	if [ -x "${node_js_path}/bin/node" ] ; then
		NODE_JS_HOME=${node_js_path} ; export NODE_JS_HOME

        if [ -z "${PNPM_HOME}" ] ; then
          PNPM_HOME="/System/Volumes/Data/data/repo/node.js/pnpm" ; export PNPM_HOME
          alias pn=pnpm
        fi

		PATH=${NODE_JS_HOME}/bin:${node_prefix_path}/bin:${PNPM_HOME}:${PNPM_HOME}/bin:${PATH} ; export PATH
	fi

	
	unset node_js_path
	unset node_js_version
fi
