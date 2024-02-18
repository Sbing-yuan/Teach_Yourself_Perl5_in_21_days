#!/usr/local/bin/perl

$out = &add_num(1,2);
print("$out\n");

$out = &add_num(3,4);
print("$out\n");

$out = &add_num(5,6);
print("$out\n");

$out = &add_num(7,8);
print("$out\n");

sub add_num {
	my ($num1, $num2) = @_;
	my $total_num;
	$total_num = $num1 + $num2;
}
