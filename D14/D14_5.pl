#!/usr/local/bin/perl

open (CODEDFILE, "codefile") ||
        die ("Can't open input file");
open (OUTFILE, ">outfile") ||
        die ("Can't open output file");
while ($line = <CODEDFILE>) {
        $decoded = unpack("u", $line);
        print OUTFILE ($decoded);
}
close (OUTFILE);
close (CODEDFILE);
