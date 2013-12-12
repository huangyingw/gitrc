#!/bin/bash
if (git status|grep -q 'nothing to commit')
then
  git difftool `git log --oneline|awk 'NR==2{print $1}'`
  exit 0
else
  if [ -z "$1" ];
  then
    git difftool
  else
    git difftool "$1"
  fi
fi
