#!/usr/local/bin/perl

while (<>) {
        while (/(-?\d+)\.(\d+)([eE][+-]?\d+)?/g) {
                print ("integer part $1, decimal part $2");
                if ($3 ne "") {
                        print (", exponent $3");
                }
                print ("\n");
        }
}
