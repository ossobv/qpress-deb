#!/bin/sh -eux
QPRESS=../../qpress

mkdir tmp
cd tmp
dd if=/dev/zero of=zeroes bs=1K count=K
touch empty
$QPRESS empty zeroes archive.qp
rm empty zeroes
echo "4072c884edaa3e2c0968dfab82164566  archive.qp" | md5sum -c
$QPRESS -d archive.qp .
echo "d41d8cd98f00b204e9800998ecf8427e  empty" | md5sum -c
echo "b6d81b360a5672d80c27430f39153e2c  zeroes" | md5sum -c
