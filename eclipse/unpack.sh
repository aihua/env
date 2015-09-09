#!/bin/sh

for file in *.pack.gz
do
	filename=${file%.pack.gz}
	unpack200 -r $file $filename
done

