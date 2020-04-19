#!/bin/bash -x

# parse

while [[ $# > 0 ]] ; do
  if [[ "$1" == "--key" ]]; then
    keyPath=$2
    shift 2
  elif [[ "$1" == "--ami" ]]; then
    amiAddr=$2
    shift 2
  else
    echo "unknown cla"
    exit 1
  fi
done

if [[ -z "$keyPath" || -z "$amiAddr" ]]; then
  echo "--key and --ami are required args"
  exit 1
fi

docker save sous:alpha > sous.tar

if [ $? != 0 ]; then
  echo "failed to save docker as tar"
  exit 1
fi

scp -i "$keyPath" sous.tar $amiAddr:~
