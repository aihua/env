#!/bin/sh

if [ -z "${RUST_HOME}" ] ; then
  rust_version="1.89.0"
  rust_path="/opt/rust/${rust_version}"

  if [ -x "${rust_path}/bin/rustc" ] ; then
    RUST_HOME=${rust_path} ; export RUST_HOME
    CARGO_HOME=/data/repo/cargo ; export CARGO_HOME
    PATH=${RUST_HOME}/bin:${CARGO_HOME}/bin:${PATH} ; export PATH
  fi

  unset rust_path
  unset rust_version
fi
