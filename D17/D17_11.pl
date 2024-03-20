#!/usr/local/bin/perl

$; = "::";
$array{"hello","there"} = 46;
$test1 = $array{"hello","there"};
$test2 = $array{"hello::there"};
print ("$test1 $test2\n");
