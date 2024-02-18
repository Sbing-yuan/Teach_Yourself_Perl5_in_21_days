#!/usr/local/bin/perl

@array = (1, 2, 3, 4, 5, 'a', 'b', 'c');
&rev_list(0, @array);

sub rev_list {
	my ($index, @array) = @_;
	
	if($index < @array-1) {
		&rev_list($index+1, @array);	
	}

	print("$array[$index], ");
}
