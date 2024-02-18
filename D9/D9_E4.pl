#!/usr/local/bin/perl

srand();

for($i=1; $i<=100; $i++){
	$var = &dice_rand();	
	print("$var ");
	if($i%10 == 0) {
		print("\n");	
	}
}

sub dice_rand{
	my $var;
	$var = int(rand(6)) + 1;
}
