#!/bin/bash

if [ $# -lt 1 ]; then
  echo "usage: $0 rev_number"
  exit 1
fi

cd oregoncore
hg export $1 -o ../$1.patch

exit 0

