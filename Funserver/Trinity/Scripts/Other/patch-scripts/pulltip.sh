#!/bin/sh

echo "Cleaning up..."
rm -rf oregoncore*

echo "Pulling source..."
hg clone http://bitbucket.org/celtus/oregoncore-mirror
cd oregoncore-mirror
CURRENTREV=`hg log | head -1 | awk -F: '{print $2}' | tr -d " "`
cd ..

echo "Creating base code dir..."
cp -av oregoncore-mirror oregoncore-$CURRENTREV
ln -s oregoncore-$CURRENTREV oregoncore-current
rm -rf oregoncore-current/.hg*

echo "Done - run newpq.sh to get a new PQ tree."

# EOF
