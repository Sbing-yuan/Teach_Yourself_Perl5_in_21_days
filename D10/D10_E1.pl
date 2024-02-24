#!/usr/local/bin/perl

%list;
while($inputline = <STDIN>) {
	$inputline =~ s/^\s+|\s+\n$//g;
	@words = split(/\s+/, $inputline);
	$list{$words[0]} = $words[1];
}

foreach my $key (sort keys(%list)) {
	print("$key => $list{$key}\n");
}
