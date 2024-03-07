#!/usr/local/bin/perl

@array = &mysub();
$scalar = &mysub();

sub mysub {
        if (wantarray()) {
                print ("true\n");
        } else {
                print ("false\n");
        }
}  
