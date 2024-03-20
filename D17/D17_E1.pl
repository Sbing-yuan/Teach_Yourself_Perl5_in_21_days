#!/usr/local/bin/perl

while(<>) {
    s/\s+/ /g;
    tr/A-Z/a-z/;
    print;
}
