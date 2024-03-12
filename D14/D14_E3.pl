#!/usr/local/bin/perl

print("Input a number: ");
$num = <STDIN>;
chop($num);

$num *= 100;
$num = int ($num + 0.5);
$num = sprintf ("%.2f", $num / 100);

print("Round: $num\n")
