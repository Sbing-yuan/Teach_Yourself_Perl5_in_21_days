#!/usr/local/bin/perl

print("Input binary string1: ");
$string1 = <STDIN>;
chop($string1);

print("Input binary string2: ");
$string2 = <STDIN>;
chop($string2);

$len1 = length($string1);
$len2 = length($string2);

if($len1 > $len2) {
	$string2 = ("0"x($len1 - $len2)).$string2
}
elsif($len2 > $len1) {
	$string1 = ("0"x($len2 - $len1)).$string1
}

$byte1 = pack ("b*", $string1); #
$byte2 = pack ("b*", $string2); #

$ptr = length($string1)-1;
while($ptr >= 0) {
	$sum = 	 (vec($byte1, $ptr, 1) + vec($byte2, $ptr, 1) + $carry) % 2;
	$carry = (vec($byte1, $ptr, 1) + vec($byte2, $ptr, 1) + $carry) / 2;
	$carry = int($carry);
	unshift(@ans, $sum);
	$reach_end = ($ptr == 0);
	if($reach_end) {
		if($carry == 1) {
			unshift(@ans, 1);
		}
	}
	$ptr--;
}

print(@ans);
