#!/usr/local/bin/perl

$num = <STDIN>;
if($num =~ /\./) {
	$outstr = sprintf("float: %f\nexponent: %e\n", $num, $num);
	print ($outstr);
}
else {
	$outstr = sprintf("decimal: %d\noctal: %o\nhex: %x\n", $num, $num, $num);
	print ($outstr);
}
