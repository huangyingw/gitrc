#!/bin/bash
if [ -z "$1" ];
then
  TARGETEDIR="$PWD"
else
  TARGETEDIR="$1"
fi
RESULT="$TARGETEDIR"/fgs.findresult
function rec_dir() {
if [[ $2 -gt 6 ]]; then
  return 
fi
for file in `ls $1`
do
  if [ -d "$1/$file" ]
  then
    if [ -d "$1/$file/.git" ]
    then
      cd "$1/$file"
      if  ( git status|grep -q modified: )
      then
        echo "`pwd` --> unclean" >> "$RESULT"
      fi 
      ~/gitrc/gps.sh 1>/dev/null 2>&1
      cd - 1>/dev/null
    else
      rec_dir "$1/$file" $(($2 + 1))
    fi
  fi 
done
}
rm "$RESULT"
rec_dir "$TARGETEDIR" 0
