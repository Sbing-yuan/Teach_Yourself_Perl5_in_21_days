#!/usr/local/bin/perl

$string1 = "00000110";
$string2 = "00000100";
$byte1 = pack ("b*", $string1); #
$byte2 = pack ("b*", $string2); #

print(vec($byte1, 0, 1));
print(vec($byte1, 1, 1));
print(vec($byte1, 2, 1));
print(vec($byte1, 3, 1));
print(vec($byte1, 4, 1));
print(vec($byte1, 5, 1));
print(vec($byte1, 6, 1));
print(vec($byte1, 7, 1));
print("\n");

print(vec($byte2, 0, 1));
print(vec($byte2, 1, 1));
print(vec($byte2, 2, 1));
print(vec($byte2, 3, 1));
print(vec($byte2, 4, 1));
print(vec($byte2, 5, 1));
print(vec($byte2, 6, 1));
print(vec($byte2, 7, 1));
print("\n");

$ptr = length($string1)-1;
while($ptr >= 0) {
	$sum = 	 (vec($byte1, $ptr, 1) + vec($byte2, $ptr, 1) + $carry) % 2;
	$carry = (vec($byte1, $ptr, 1) + vec($byte2, $ptr, 1) + $carry) / 2;
	print("$sum\n");
	$ptr--;
}
