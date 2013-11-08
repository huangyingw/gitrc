#!/bin/bash
fix_branch=`git branch |awk '/^\*/{print $2}'`.fix
echo $fix_branch
git checkout -b $fix_branch
