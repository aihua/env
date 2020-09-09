#!/bin/sh

if [ -z "${RUST_HOME}" ] ; then
	rust_version="1.46.0"
	rust_path="/opt/rust/${rust_version}"
    rust_toolchain_path="${rust_path}/toolchains/stable-x86_64-apple-darwin"

	if [ -x "${rust_toolchain_path}/bin/rustc" ] ; then
		RUST_HOME=${rust_toolchain_path} ; export RUST_HOME
        CARGO_HOME=/data/repo/cargo ; export CARGO_HOME
        RUSTUP_HOME=${rust_path} ; export RUSTUP_HOME
		PATH=${RUST_HOME}/bin:${RUSTUP_HOME}/bin:${PATH} ; export PATH
	fi
	
	unset rust_path
	unset rust_version
fi
