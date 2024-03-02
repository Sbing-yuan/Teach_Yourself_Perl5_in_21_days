#!/usr/local/bin/perl

@vals = (1..6);

foreach $val (@vals) {
	$time_begin = times;
	$out = &sum_expo($val);
	$time_end = times;
	$time_pass = $time_end - $time_begin;
	printf("%40d, pass_time: %5d\n", $out, $time_pass);
}

sub sum_expo {
	my($iter) = @_;
	my $sum = 1;
	for (my $i = 1; $i <= $iter; $i++) {
		$sum +=	10**$i
	}
	$sum;
}
