#!/usr/local/bin/perl

$vector = pack ("B*", "11010011");
$val1 = vec ($vector, 0, 4);
$val2 = vec ($vector, 1, 4);
print ("high-to-low order values: $val1 and $val2\n");
$vector = pack ("b*", "11010011");
$val1 = vec ($vector, 0, 4);
$val2 = vec ($vector, 1, 4);
print ("low-to-high order values: $val1 and $val2\n");
