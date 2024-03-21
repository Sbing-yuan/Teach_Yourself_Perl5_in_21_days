#!/usr/bin/perl

sub a {};

$p1 = \$a;
$p2 = \@a;
$p3 = \%a;
$p4 = \&a;

print "$p1 \n";
print "$p2 \n";
print "$p3 \n";
print "$p4 \n";
