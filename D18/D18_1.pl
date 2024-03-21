#!/usr/bin/perl
#
# Using Array references
#
$pointer = \@ARGV;
printf "\n Pointer Address of ARGV = $pointer\n";
$i = scalar(@$pointer);
printf "\n Number of arguments : $i \n";
$i = 0;
 foreach (@$pointer) {
 printf "$i : $$pointer[$i++]; \n";
 }
