#!/bin/sh -

wait() {
a=none
#echo 'waiting for: ' x"$1"x
while [ x"$a" != x"$1" ]; do
	a=$(nc -l 3333)
	#echo 'got: ' x"$a"x
	if [ x"$a" = x"exit" ]; then
		echo exiting...
		exit 1
	fi
done
}

wait start
echo starting...

for i in *.conf; do
	echo setting $i
	setkey -f $i
	wait next
done
