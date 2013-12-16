#!/bin/bash
if [ -n "$1" ];
then
  git difftool "$1"
else
  if (git status|grep -q 'nothing to commit')
  then
    git difftool `git log --oneline|awk 'NR==2{print $1}'`
  else
    git difftool
  fi
fi
