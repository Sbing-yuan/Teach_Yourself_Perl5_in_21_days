#!/usr/local/bin/perl

&cmp_file("file1","file2");
&cmp_file("file2","file3");
&cmp_file("file3","file4");
&cmp_file("file1","file1");

sub cmp_file {
	my ($file1, $file2) = @_;
	die("$file1 open fail") unless (open(FILE1, $file1));
	die("$file2 open fail") unless (open(FILE2, $file2));
	$not_equal = 0;
	$data1 = <FILE1>;
	$data2 = <FILE2>;
	while(($data1 ne "") || ($data2 ne "")) {
		if($data1 ne $data2) {
			$not_equal = 1;	
			last;
		}	
		$data1 = <FILE1>;
		$data2 = <FILE2>;
	}

	if($not_equal) {
		print("$file1 , $file2 are not equal\n");	
	}
	else {
		print("$file1 , $file2 are equal\n");	
	}
}
