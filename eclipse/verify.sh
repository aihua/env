#!/bin/sh


for file in *.md5 ; do
	md5sum -c $file
done
