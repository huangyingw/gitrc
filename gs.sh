#!/bin/bash
if [ -n "$1" ];
then
  git status "$1" > find.cc
else
  git status > find.cc 
fi
vi find.cc
