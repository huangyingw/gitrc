#!/bin/bash

last_message=`git log -1 --pretty=%B|awk 'NR==1'`
echo $last_message
new_message="$1 $last_message"
git commit --amend -m "$new_message"
