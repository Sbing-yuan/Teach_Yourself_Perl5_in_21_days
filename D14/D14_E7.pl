#!/usr/local/bin/perl

%my_hash1 = (
	'A' => 'Apple', 
	'B' => 'Ball', 
	'C' => 'Charlie', 
	'D' => 'Delta' 
);

%my_hash2 = (
	'A' => 'Apple', 
	'B' => 'Ball', 
	'C' => 'Charlie', 
	'D' => 'Delta', 
	'De' => 'Delta' 
);

print("hash1: ", %my_hash1, "\n");
print("hash2: ", %my_hash2, "\n");

%my_hash1 = &flip_hash(%my_hash1);
%my_hash2 = &flip_hash(%my_hash2);

print("hash1: ", %my_hash1, "\n");
print("hash2: ", %my_hash2, "\n");

sub flip_hash{
	my(%my_hash) = @_;
	my %temp_hash = ();
	foreach my $k (keys %my_hash) {
		if(exists $temp_hash{$my_hash{$k}}) {
			print("double subscript detected\n");
			return '';
		}
		$temp_hash{$my_hash{$k}} = $k;
	}
	return %temp_hash;
}
