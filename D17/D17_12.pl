#!/usr/local/bin/perl

print ("Enter the search pattern:\n");
$string = <STDIN>;
chop ($string);
while ($line = <>) {
        if ($line =~ /$string/) {
                print ("$ARGV:$line");
        }
}
