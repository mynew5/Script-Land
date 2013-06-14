#!/bin/sh

echo "Building OregonCore-PQ..."

cd oregoncore-pq

if [ ! -d build ]; then
  mkdir build
fi

cd build

cmake ../ -DTOOLS=1 -DPREFIX=$HOME -DACE_LIBRARY=$HOME/lib/libACE.so -DACE_INCLUDE_DIR=$HOME/include && make 
RSLT=$?

#EOF
