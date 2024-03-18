#!/usr/local/bin/perl

while ($line = <>) {
        #print("Ori: $line");
        while ($line =~
                s#\d+(\.\d)?\s*[*+/-]\s*\d+(\.\d)?#<x>#) {
                eval ("\$result = $&;");
                #print("Mid1: $line");
                $line =~ s/<x>/$result/;
                #print("Mid2: $line");
        }
        print ($line);
}
