#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
if [ -n "$1" ];
then
  git stash pop stash@{"$1"}
  exit 0
fi
if ! (git status|grep -q 'nothing to commit')
then
  echo -e "${red}the git repository is unclean, please check it before continuing... ${NC}"
  exit 0
fi
top_branch=`git stash list|awk 'NR==v1 {print $4}' v1=$(($1+1)) |sed 's/://g'`
echo $top_branch
git branch |awk '/^\*/{print $2}'
git co $top_branch
git stash pop
