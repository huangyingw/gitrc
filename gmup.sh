#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
current_branch=`git branch |awk '/^\*/{print $2}'`
up_branch=`echo ${current_branch} | sed 's/\(\.[^.]*\)$//'`
echo $current_branch
echo $up_branch
git checkout $up_branch \
  && git merge $current_branch \
  && ~/gitrc/gcia.sh "merge from $current_branch to $up_branch"
