#!/usr/local/bin/perl

$var = 1;
while($var <= 5) {
	$line = <STDIN>;	
	if($line eq "") {
		print("pre-Exit\n");
		last;
	}
	print("line $var: $line");	
	$var++;
}
