#!/bin/sh -

longkey="12345678901234567890123456789012345678901234567890123456789012345678901234567890"

nbytes=$(echo -n "$longkey" | wc -c)

for ealg in $(sort -u < esp.txt | awk '{print $1}'); do
	echo 'esp: ' $ealg
	for j in `jot $nbytes 1`; do
		(
		echo 'flush;'
		keystr=$(echo $longkey | dd bs=1 count=$j 2>/dev/null)
		echo 'add 192.168.6.1 192.168.6.2 esp 1383 -E '"$ealg"' "'"$keystr"'";' ) | setkey -c
	done
done

for aalg in $(sort -u < ah.txt | awk '{print $1}'); do
	echo 'ah: ' $aalg
	for j in `jot $nbytes 1`; do
		( echo 'flush;'

		keystr=$(echo $longkey | dd bs=1 count=$j 2>/dev/null)
		echo 'add 192.168.6.1 192.168.6.2 ah 0x10001 -A '"$aalg"' "'"$keystr"'";' ) | setkey -c
	done
done
