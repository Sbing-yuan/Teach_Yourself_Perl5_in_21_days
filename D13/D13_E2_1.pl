#!/usr/local/bin/perl

die("Fail to open file temp") unless(open(fh, "temp"));

while($line = <fh>) {
	print($line);
}
