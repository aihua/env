#!/bin/sh

find . -type f -name "*.java" -exec sh -c "iconv -f GB18030 -t UTF-8 {} > {}.utf8"  \; -exec mv "{}".utf8 "{}" \;
