#!/bin/bash

go build

if [ ! -f main.go ]; then
  echo "no source files"
  exit 1
fi

if [ $? != 0 ]; then
  echo "build failed"
  exit 1
fi

./react-app

