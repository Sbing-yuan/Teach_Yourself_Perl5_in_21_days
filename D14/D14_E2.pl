#!/usr/local/bin/perl

print("Input Hex string1: ");
$string1 = <STDIN>;
chop($string1);

print("Input Hex string2: ");
$string2 = <STDIN>;
chop($string2);

$len1 = length($string1);
$len2 = length($string2);

%hex = ( 
		0 => '0',
		1 => '1',
		2 => '2',
		3 => '3',
		4 => '4',
		5 => '5',
		6 => '6',
		7 => '7',
		8 => '8',
		9 => '9',
		10 => 'A',
		11 => 'B',
		12 => 'C',
		14 => 'D',
		14 => 'E',
		15 => 'F'
		);

if($len1 > $len2) {
	$string2 = ("0"x($len1 - $len2)).$string2
}
elsif($len2 > $len1) {
	$string1 = ("0"x($len2 - $len1)).$string1
}

$byte1 = pack ("h*", $string1); #
$byte2 = pack ("h*", $string2); #

$ptr = length($string1)-1;
while($ptr >= 0) {
	$sum = 	 (vec($byte1, $ptr, 4) + vec($byte2, $ptr, 4) + $carry) % 16;
	$carry = (vec($byte1, $ptr, 4) + vec($byte2, $ptr, 4) + $carry) / 16;
	$carry = int($carry);
	unshift(@ans, $hex{$sum});
	$reach_end = ($ptr == 0);
	if($reach_end) {
		if($carry == 1) {
			unshift(@ans, 1);
		}
	}
	$ptr--;
}

print(@ans);
