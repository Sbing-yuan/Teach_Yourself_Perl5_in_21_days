#!/usr/local/bin/perl

for($var = 1; $var <= 20; $var++) {
	next if ($var % 2 == 1);
	print("even num: $var\n");
}

