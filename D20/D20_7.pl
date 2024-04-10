#/usr/local/bin/perl

use integer;
$result = 2.4 + 2.4;
print ("$result\n");

no integer;
$result = 2.4 + 2.4;
print ("$result\n");
