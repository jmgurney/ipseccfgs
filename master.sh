#!/bin/sh -

sendcmd() {
	echo "$1" | nc -N 192.168.6.2 3333
}

sendcmd start

for i in *.conf; do
	echo running $i
	setkey -f $i && ping -t 3 -c 2 10.0.0.1 >ping.log || (echo 'failed!'; cat ping.log)
	sendcmd next
done
