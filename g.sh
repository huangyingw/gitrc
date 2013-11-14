#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0;0m' # No Color

~/gitrc/gps.sh
if [ -z "$1" ];
then
    echo -e "${red}Please provide commit message ... ${NC}"
    exit 1
fi
git commit  --no-verify -m "$1" && git gc
