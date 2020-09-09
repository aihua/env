#!/bin/sh

if [ -x "/usr/local/bin/brew" ] ; then
   HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles ; export HOMEBREW_BOTTLE_DOMAIN 
fi
