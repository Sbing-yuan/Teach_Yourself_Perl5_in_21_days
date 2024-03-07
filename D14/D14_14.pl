#!/usr/local/bin/perl

while (1) {
        $currarg = shift;
        last if (!defined($currarg));
        print ("$currarg\n");
}
