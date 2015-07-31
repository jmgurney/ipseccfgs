#!/bin/sh -

rm -rf a b &&
mkdir a b &&
for i in *.conf; do
	type=${i%%.*}
	cat common.ab sp.${type}.a $i > a/$i
	cat common.ab sp.${type}.b $i > b/$i
done
cp master.sh a
cp slave.sh b
