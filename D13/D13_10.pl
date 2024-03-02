#!/usr/local/bin/perl

$string = "here is a string";
$_ = $string;
$length = tr/a-zA-Z /a-zA-Z /;
print ("the string is $length characters long\n");
