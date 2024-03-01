#What is wrong with the following program?
#!/usr/local/bin/perl

#while ($line = <>) {
#print ($line);
#if (eof()) {
#print ("-- end of current file --\n");
#}
#}
# eof() -> all files, eof -> current file
while ($line = <>) {
	print ($line);
	if (eof) {
		print ("-- end of current file --\n");
	}
}
