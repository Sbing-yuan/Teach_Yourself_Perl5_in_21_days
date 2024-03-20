#!/usr/local/bin/perl

open (FILE1, "file1") ||
        die ("Can't open file1\n");
open (FILE2, "file2") ||
        die ("Can't open file2\n");
$input = <FILE1>;
$input = <FILE1>;
print ("line number is $.\n");
$input = <FILE2>;
print ("line number is $.\n");
$input = <FILE1>;
print ("line number is $.\n");
