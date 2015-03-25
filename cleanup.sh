#!/bin/sh

apt-get clean
apt-get autoclean
apt-get autoremove
dpkg -l | grep ^rc | awk '{print $2}' | xargs dpkg -P
