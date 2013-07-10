#!/bin/bash
CURRENT_BRANCH="`git branch |awk '/^\*/{print $2}'`"
TARGET_BRANCH="$1"
git add . \
  && git stash|grep -q "HEAD is now at" \
  && git checkout "$TARGET_BRANCH" \
  && git merge "$CURRENT_BRANCH" \
  && git checkout "$CURRENT_BRANCH" \
  && git stash pop stash@{0} \
  && git reset HEAD . 
