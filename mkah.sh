#!/bin/sh -

longkey="1234567890123456789012345678901234567890123456789012345678901234"

while read aalg nbits; do
	keystr=$(echo $longkey | dd bs=1 count=$(($nbits / 8)) 2>/dev/null)

	cat <<EOF > "ah.gen.$aalg.conf"
add 192.168.6.1 192.168.6.2 ah 0x10001 -A $aalg "$keystr";
add 192.168.6.2 192.168.6.1 ah 0x10001 -A $aalg "$keystr";
EOF

done < ah.txt
