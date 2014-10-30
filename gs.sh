#!/bin/bash
if [ -n "$1" ];
then
  git status "$1" > find.findresult
else
  git status > find.findresult 
fi
