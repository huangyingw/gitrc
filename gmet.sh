#!/bin/bash
CURRENT_BRANCH="`git branch |awk '/^\*/{print $2}'`"
TARGET_BRANCH="$1"
git checkout "$TARGET_BRANCH" \
  && git merge "$CURRENT_BRANCH" \
  && git checkout "$CURRENT_BRANCH"
