#!/bin/bash
if [ -z "$1" ];
then
    git stash pop
else
    git stash pop stash@{"$1"}
fi
