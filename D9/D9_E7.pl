#What is wrong with the following program?
#!/usr/local/bin/perl
#
#$line = <STDIN>;
#@words = split(/\s+/, $line);
#$searchword = <STDIN>;
#&search_for_word (@words, $searchword);
#
#sub search_for_word {
#local (@searchlist, $searchword) = @_;
#foreach $word (@searchlist) {
#return (1) if ($word eq $searchword);
#}
#$retval = 0;
#}


$line = <STDIN>;
@words = split(/\s+/, $line);
$searchword = <STDIN>;
chop($searchword);
#&search_for_word (@words, $searchword);
$test_cond = &search_for_word ($searchword, @words);

if($test_cond) {
	print("Found!\n");
}

sub search_for_word {
	#local (@searchlist, $searchword) = @_;
	local ($searchword, @searchlist) = @_;
	foreach $word (@searchlist) {
		return (1) if ($word eq $searchword);
	}
	$retval = 0;
}
