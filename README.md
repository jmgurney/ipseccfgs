set of scripts and configs for testing ipsec...

How to use these scripts:

1) sh mkah.sh	# generate ah.gen.*.conf files
2) sh mkesp.sh	# generate esp.gen.*.conf files
3) sh mk.sh	# generate directories a and b
4) copy directory a to one machine, and b to a different machine
5) on the b machine in the b directory, run: sh slave.sh
6) on the a machine in the a directory, run: sh master.sh

Command descriptions:

mkah.sh and mkesp.sh:
These commands take the respective ah.txt and esp.txt files, and use them
to generate stub config files for each algorithm with a key of the
specified size.

mk.sh:
Takes all the .conf files, and creates two directories, a (master) and
b (slave), which contains script to drive the tests...  To create each
conf file in the subdirs, it prepends common.ab, and appends either
sp.ah.[ab] or sp.esp.[ab] depending upon if the conf file starts w/
either ah or esp.

genkeys.sh:
This is a script that will generate all keys sizes from 1 through 80 bytes,
and all ah and esp algorithms specified in ah.txt and esp.txt.  This is
to make sure things don't panic or other bad behavior.
