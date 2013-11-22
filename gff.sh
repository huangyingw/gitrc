#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color

if [ -z "$1" ];
then
  echo -e "${red}Please provide the file name in full ... ${NC}"
  exit 1
fi

commit=`git log --all -- "$1"|awk 'NR==1{print $2}'`
if [ -z "$commit" ];
then
  echo -e "${red}The file is not found ... ${NC}"
  exit 1
fi
echo "$commit"
git branch --contains "$commit"