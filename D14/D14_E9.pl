#!/usr/local/bin/perl

while($line = <STDIN>) {
	@words = split(/\s+/, $line);
	for ($i=0; $i<@words; $i++) {
		print("$words[$i]\n");
	}
}

