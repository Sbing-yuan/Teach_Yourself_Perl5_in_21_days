#!/usr/local/bin/perl

while (<STDIN>) {
        ($first) = split (//, $_);
        print ("$first\n");
}
