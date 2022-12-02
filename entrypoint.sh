#!/bin/bash

EMSDK_QUIET=1 source /emsdk/emsdk_env.sh

# this gets messed up in emsdk_env
export EMSDK_NODE=/usr/local/bin/node
export PATH="/usr/local/bin:${PATH}"

if [ "$1" == "watch" ];then
  echo "Starting watching server."
  WEBROOT=/src/webroot
  if [ ! -d "/src/webroot" ];then
    WEBROOT=/usr/local/share/raylib-wasm/webroot
  fi
  cd /src/build
  nodemon --exec "make build" & live-server --root="${WEBROOT}" --no-browser --port=8000 --host=0.0.0.0 --watch=./,../webroot --mount=./:/wasm --mount=../assets:/assets && fg
elif [ "$1" == "" ];then
  echo "Running wasm build."
  
  if [ ! -f "/src/CMakeLists.txt" ];then
    cd /usr/local/share/raylib-wasm/
  fi

  cmake -B /src/build /src
  cd /src/build
  make
else
  exec $*
fi
