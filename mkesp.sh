#!/bin/sh -

longkey="1234567890123456789012345678901234567890123456789012345678901234"

while read ealg nbits; do
	keystr=$(echo $longkey | dd bs=1 count=$(($nbits / 8)) 2>/dev/null)

	cat <<EOF > "esp.gen.$ealg.$nbits.conf"
add 192.168.6.1 192.168.6.2 esp 1383 -E $ealg "$keystr" -A hmac-sha2-256 "12345678901234567890123456789012";
add 192.168.6.2 192.168.6.1 esp 1383 -E $ealg "$keystr" -A hmac-sha2-256 "12345678901234567890123456789012";
EOF

done < esp.txt
