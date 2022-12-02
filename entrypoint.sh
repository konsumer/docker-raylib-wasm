#!/bin/sh

source /emsdk/emsdk_env.sh

if [ "$1" == "watch" ];then
  echo "Starting watching server."
elif [ "$1" == "" ];then
  echo "Starting wasm build."
  
  if [ ! -f "/src/CMakeLists.txt" ];then
    cd /usr/local/share/
  fi

  cmake -B /src/build /src
  cd /src/build
  make
else
  exec $*
fi
