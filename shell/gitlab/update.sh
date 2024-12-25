#!/bin/bash

repos=`cat repo.txt`

for repo in $repos
do
  echo $repo
  cd $repo && git pull && git remote prune origin && cd ..
done
