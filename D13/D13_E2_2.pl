#!/usr/local/bin/perl

die("fail to write file temp") unless (open(fh, ">temp"));

while($line = <STDIN>) {
	print fh ($line);
}

exec("perl D13_E2_1.pl");
