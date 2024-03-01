#!/usr/local/bin/perl

@array = ("This", "is", "a", "test");
open (TEMPFILE, ">file1");
foreach $element (@array) {
        print TEMPFILE ("$element\n");
}
close (TEMPFILE);
open (TEMPFILE, "file1");
while (1) {
        $skipback = tell(TEMPFILE);
        $line = <TEMPFILE>;
        last if ($line eq "");
        print ($line);
        $line = <TEMPFILE>;  # assume the second line exists
        print ($line);
        seek (TEMPFILE, $skipback, 0);
        $line = <TEMPFILE>;
        print ($line);
        $line = <TEMPFILE>;
        print ($line);
}
