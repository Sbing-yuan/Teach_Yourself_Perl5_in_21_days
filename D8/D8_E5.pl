#!/usr/local/bin/perl

@array = ();
while($line = <STDIN>) {
	$line =~ s/^[\t ]*//;
	$line =~ s/[\t ]*\n$//;
	@words = split(/[\t ]+/, $line);
	@array = (@array, @words);
}

$sum_thes = 0;
foreach $elem (@array){
	if($elem =~ /the/i) {
		$sum_thes++;
	}
}

print("total num of thes: $sum_thes\n");
