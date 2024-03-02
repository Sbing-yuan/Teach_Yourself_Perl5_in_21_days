#!/usr/local/bin/perl
 
$input = <STDIN>;
&locate_chr('a');
&locate_chr('e');
&locate_chr('i');
&locate_chr('o');
&locate_chr('u');


sub locate_chr {
	my($search_chr) = @_;
	$position = $found = 0;
	while (1) {
		last if ($position == length($input));
		$sub_str = substr($input, $position, 1);
		if($sub_str eq $search_chr) { #match
	        	if ($found == 0) {
	        	        $found = 1;
	        	        print ("$search_chr found - characters skipped:");
	        	}
	        	print (" $position");
		} 
	        $position++;
	}
	if ($found == 0) {
	        print ("$search_chr not found\n");
	} else {
	        print ("\n");
	}
}
