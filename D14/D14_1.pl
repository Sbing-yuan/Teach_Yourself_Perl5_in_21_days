#!/usr/local/bin/perl

$/ = "::";   # set input line separator
$scalar = "testing::";
$num = chomp($scalar);
print ("$scalar $num\n");
@list = ("test1::", "test2", "test3::");
$num = chomp(@list);
print ("@list $num\n"); 
