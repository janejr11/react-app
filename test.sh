#!/bin/bash -x
set -eou pipefail

GOOS=linux

PROJECT_NAME="react"
ALWAYSBUILDSITE=false

# parse cla
while [[ $# > 0 ]] ; do
  if [ "$1" == "--mac" ]; then
    shift 1
    unset GOOS
    export useMac=true
    echo "Building for mac"
  elif [[ "$1" == "--projectName" ]]; then
    PROJECT_NAME="$2"
    shift 2
  elif [[ "$1" == "--terraform" ]]; then
    shift 1
    useTerraform=true
  elif [[ "$1" == "--buildSite" ]]; then
    ALWAYSBUILDSITE=true
    shift 1
  else
    echo "unrecognized cla"
    exit 1
  fi
done



# build
go build main.go
if [[ $? != 0 ]]; then
  echo "go build failed"
  exit 1
fi

if [[ ! -f main.go ]]; then
  echo "no go source files"
  exit 1
fi

if [[ ! -d ${PROJECT_NAME}/node_modules ]]; then
  echo "installing deps"
  pushd ${PROJECT_NAME}
  npm install
  if [ $? != 0 ]; then
    echo "npm install failed"
    exit 1
    popd
  fi
  popd
fi

if [[ ! -d "${PROJECT_NAME}/build" || -n "${ALWAYSBUILDSITE}" ]]; then
  echo "building site"
  pushd ${PROJECT_NAME}
  npm run-script build
  if [ $? != 0 ]; then
    echo "npm build failed"
    exit 1
    popd
  fi
  popd
fi

# run
if [[ -n "$useMac" ]]; then
  ./main
else
  docker rmi sous:alpha
  docker build . -t sous:alpha

  if [[ -n "$useTerraform" ]]; then
    echo "terraform unscripted at the moment"
    exit 1
  else
    docker run -it --rm -p 8100:8100 sous:alpha
  fi
fi
