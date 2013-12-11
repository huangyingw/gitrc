#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
if ! (git status|grep -q 'nothing to commit')
then
  echo -e "${red}the git repository is unclean, please check it before continuing... ${NC}"
  exit 0
fi
top_branch=`git stash list|awk 'NR==1{print $4}'|sed 's/://g'`
git co $top_branch
git stash pop
