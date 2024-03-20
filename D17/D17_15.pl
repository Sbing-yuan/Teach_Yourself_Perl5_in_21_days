#!/usr/local/bin/perl

open (OUTFILE, ">outfile");
select ("OUTFILE");
write;
print STDOUT ("lines to go before write: $-\n");
write;
print STDOUT ("lines to go after write: $-\n");
format OUTFILE =
 This is a test.
.
format OUTFILE_TOP =
This is a test.
.
