#!/bin/bash
# this is used to reset back to the latest change on the file.
commit=`git rev-list -n 1 HEAD -- "$1"`
git checkout $commit^ -- "$1"
