#!/bin/sh

dpkg -l | awk '{print $2}' | grep "^linux"
