#!/usr/local/bin/perl

open (FILE1, ">file1");
$string = "junk";
select (FILE1);
&writeline;
select (STDOUT);
&writeline;
close (FILE1);

sub writeline {
        $~ = "WRITELINE";
        write;
}

format WRITELINE =
        I am writing @<<<<< to my output files.
                     $string
.
