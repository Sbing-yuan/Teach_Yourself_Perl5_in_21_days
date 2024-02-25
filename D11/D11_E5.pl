#What is wrong with the following program?
#!/usr/local/bin/perl
#
#format STDOUT =
#@*
#.
#while ($line = <STDIN>) {
#chop ($line);
#if ($line eq "") {
#print ("<blank line>\n");
#next;
#}
#write;
#}

format MY_FORM =
@*
$line
.

while ($line = <STDIN>) {
	chop ($line);
	if ($line eq "") {
		print ("<blank line>\n");
		next;
	}
	$~ = "MY_FORM";
	write;
}



