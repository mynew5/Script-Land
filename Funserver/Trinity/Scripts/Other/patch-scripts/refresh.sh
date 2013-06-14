#!/bin/sh

rm -rf oregoncore-pq
rm /tmp/patch.log

mkdir oregoncore-pq
cp -a oregoncore-current/* oregoncore-pq/

cd oregoncore-pq

PATCHPATH=`echo ${1} | awk -F/ '{print $1}'`
PATCHNAME=`echo ${1} | awk -F/ '{print $2}'`

echo "Applying patch $PATCHNAME from $PATCHPATH"

patch -p1 < ../oc-patch/${1} 1> /tmp/patch.log 2> /tmp/patch.log

grep rej /tmp/patch.log

if [ $? -ne 1 ]; then
  echo "Rejects found in log."
  more /tmp/patch.log
else
  find . -name *.orig | awk '{printf "rm %s\n",$1}' | sh
  cd ..
  diff -Nuar oregoncore-current oregoncore-pq > $PATCHNAME
  echo "Patch Created"
  cat /tmp/patch.log
  cd oc-patch/$PATCHPATH
  mv ../../$PATCHNAME .
  cd ..
  echo "Patch Deployed"
  hg status
fi

# EOF
