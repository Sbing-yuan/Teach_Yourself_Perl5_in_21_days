#!/usr/local/bin/perl
die ("Can't open input\n") unless (open(INFILE, "infile"));
die ("Can't open output\n") unless (open(OUTFILE, ">outfile"));
print OUTFILE ($line) while ($line = <INFILE>);
close (INFILE);
close (OUTFILE);
