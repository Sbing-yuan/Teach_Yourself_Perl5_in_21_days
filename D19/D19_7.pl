#!/usr/bin/perl
push (@INC,'pwd');
use Coffee;
$cup = new Coffee;
#
# With no parameters
#
print "\n Calling with no parameters: \n";
$cup->makeCup;
#
# With one parameter
#
print "\n Calling with one parameter: \n";
$cup->makeCup('1');
#
# With two parameters
#
print "\n Calling with two parameters: \n";
$cup->makeCup(1,'2');
#
# With all three parameters
#
print "\n Calling with three parameters: \n";
$cup->makeCup('1',3,'1');
