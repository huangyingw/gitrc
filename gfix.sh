#!/bin/bash
current_branch=`git branch |awk '/^\*/{print $2}'`
fix_branch=`git branch |awk '/^\*/{print $2}'`.fix
echo $fix_branch
git checkout HEAD \
  && git branch -d $fix_branch \
  ; ~/gitrc/gcia.sh "before initiating fix branch $fix_branch from $current_branch" \
  && git checkout -b $fix_branch
