#!/bin/bash

#Return 0 (True) if file1 is newer than file2
#Exit with 0, and echo True if file1 is newer than file2.

function Usage
{
  echo "$(basename $0) file1 file2"
  exit 1
}

if [ $# -eq 2 ]; then
  file1="$1"
  file2="$2"
  [[ ! -e "$file1" ]] && Usage
  [[ ! -e "$file2" ]] && Usage
else
  Usage
fi

let tstamp1=$(stat -c %Y "$file1")
let tstamp2=$(stat -c %Y "$file2")

if [ $tstamp1 -gt $tstamp2 ]; then
 echo 'True'
 exit 0
elif [ $tstamp1 -eq $tstamp2 ]; then
 echo 'Same'
 exit 2
else
 echo 'False'
 exit 1
fi
