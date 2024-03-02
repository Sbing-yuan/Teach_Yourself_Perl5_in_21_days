#What is wrong with the following program?
#!/usr/local/bin/perl
#$mystring = <STDIN>;
#$lastfound = length ($mystring);
#while ($lastfound != -1) {
#        $lastfound = index($mystring, "xyz", $lastfound);
#}
$mystring = <STDIN>;
$lastfound = length ($mystring);
while ($lastfound != -1) {
	$lastfound_prev = $lastfound;
        $lastfound = index($mystring, "xyz", $skip);
	$skip++;
}
print($lastfound_prev, "\n");
