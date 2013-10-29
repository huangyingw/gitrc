#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color
if [ -z "$1" ];
then
    echo -e "${red}Please provide the new branch name ... ${NC}"
    exit 1
fi
current_branch=`git branch |awk '/^\*/{print $2}'`
if [ -n "$2" ];
then
    $current_branch="$2"
fi
~/gitrc/gcia.sh "before new branch $1 from $current_branch"
git checkout -b "$1"
