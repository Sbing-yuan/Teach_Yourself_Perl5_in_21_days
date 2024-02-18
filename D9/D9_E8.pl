#!/usr/local/bin/perl
#
#$line = <STDIN>;
#@words = &split_line($line);
#print ("@words\n");
#
#sub split_line {
#local ($line) = @_;
#local (@words);
#@words = split(/\s+/, $line);
#if (@words == 0) {
#@words = ("empty list");
#}
#}

$line = <STDIN>;
@words = &split_line($line);
print ("@words\n");

sub split_line {
	local ($line) = @_;
	local (@words);
	@words = split(/\s+/, $line);
	if (@words == 0) {
		@words = ("empty list");
	}
	else {
		$retval = @words;	
	}
}
