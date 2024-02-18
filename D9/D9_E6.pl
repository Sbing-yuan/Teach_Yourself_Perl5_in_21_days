#What is wrong with the following program?
#!/usr/local/bin/perl
#
#for ($count = 1; $count <= 10; $count++) {
#&print_ten ($count);
#}
#
#sub print_ten {
#local ($multiplier) = @_;
#for ($count = 1; $count <= 10; $count++) {
#$printval = $multiplier * 10 + $count;
#print ("$printval\n");
#}
#}
for ($count = 1; $count <= 10; $count++) {
	&print_ten ($count);
}

sub print_ten {
	local ($multiplier) = @_;
	local $count;
	for ($count = 1; $count <= 10; $count++) {
		$printval = $multiplier * 10 + $count;
	print ("$printval\n");
	}
}
