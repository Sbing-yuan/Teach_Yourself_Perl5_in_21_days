#!/usr/local/bin/perl

die("Infile not found") unless open($fh, "Infile");

%word_list;
while($line = <$fh>){
	#print($line);	
	$line_num += 1;
	if($line =~ /index (\w+)/) {
		$word = $1;	
		$postfix = 1;
		while(exists $word_list{$word.$postfix}) {
			$postfix += 1;
		}
		$word_list{$word.$postfix} = $line_num;	
	} 
}

foreach my $key (sort keys(%word_list)) {
	print("$key => $word_list{$key}\n");
}
