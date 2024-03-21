#!/usr/bin/perl
#
# Using Multi-dimensional Array and Hash references
#
%cube = (
'0', ['0', '0', '0'],
'1', ['0', '0', '1'],
'2', ['0', '1', '0'],
'3', ['0', '1', '1'],
'4', ['1', '0', '0'],
'5', ['1', '0', '1'],
'6', ['1', '1', '0'],
'7', ['1', '1', '1']
);
$pointer = \%cube;
print "\n Da Cube \n";
foreach $i (sort keys %$pointer) {
$list = $$pointer{$i};
$x = $list->[0];
$y = $list->[1];
$z = $list->[2];
printf " Point $i = $x,$y,$z \n";
}
