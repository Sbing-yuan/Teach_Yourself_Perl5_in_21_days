#!/usr/local/bin/perl -0040

while ($line = <>) {
        $line =~ s/\n//g;
        next if ($line eq "");
        print ("$line\n");
}
