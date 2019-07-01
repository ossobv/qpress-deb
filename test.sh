#!/bin/sh -eux
QPRESS=../../qpress

QLEVEL=1
QLZCAT=../../qlzcat$QLEVEL
QLZIP=../../qlzip$QLEVEL
QLUNZIP=../../qlunzip$QLEVEL
SUFFIX=.qz$QLEVEL

mkdir tmp
cd tmp
dd if=/dev/zero of=zeroes bs=1K count=K
touch empty
echo 'The quick brown fox jumped over the lazy dog.' >lazydog
set +x
for x in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do
    mv lazydog lazydog.tmp
    cat lazydog.tmp lazydog.tmp > lazydog
done
rm lazydog.tmp
set -x
FILES="empty lazydog zeroes"
ls -l $FILES
md5sum $FILES
echo ---------------------------------------------------------------- >&2

$QPRESS -L1 $FILES archive1.qp
$QPRESS -L2 $FILES archive2.qp
$QPRESS -L3 $FILES archive3.qp
ls -l archive1.qp archive2.qp archive3.qp
md5sum archive1.qp archive2.qp archive3.qp

md5sum -c <<EOF
6b5f5d2c65e2822682c8788a4bf8edc0  archive1.qp
a10516424ea4cff14a821edebcea06d3  archive2.qp
b434ad176e28af6bad21a7a3bef3d166  archive3.qp
EOF
for archive in archive1.qp archive2.qp archive3.qp; do
    rm empty lazydog zeroes
    $QPRESS -d $archive .
    md5sum -c << EOF
d41d8cd98f00b204e9800998ecf8427e  empty
4cbac75f101811218de18f9e6554b72c  lazydog
b6d81b360a5672d80c27430f39153e2c  zeroes
EOF
done
echo ---------------------------------------------------------------- >&2

for file in $FILES; do
    $QLZIP $file
done
ls -l empty* lazydog* zeroes*
md5sum empty* lazydog* zeroes*
md5sum -c <<EOF
d41d8cd98f00b204e9800998ecf8427e  empty$SUFFIX
2f54da75ab3eef5a5887c9b744a33916  lazydog$SUFFIX
7cd8108bbb7d0484b4db00494472d976  zeroes$SUFFIX
EOF
for file in $FILES; do
    $QLUNZIP $file$SUFFIX
done
md5sum -c << EOF
d41d8cd98f00b204e9800998ecf8427e  empty
4cbac75f101811218de18f9e6554b72c  lazydog
b6d81b360a5672d80c27430f39153e2c  zeroes
EOF
