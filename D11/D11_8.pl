#!/usr/local/bin/perl

open (OUTFILE, ">file1");
select (OUTFILE);
$~ = "WRITELINE";
$^ = "TOP_OF_PAGE";
$= = 3;
while ($line = <STDIN>) {
        write;
}
close (OUTFILE);

format TOP_OF_PAGE =
                                    - page @<
                                             $%
.
format WRITELINE =
@>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
$line
.
