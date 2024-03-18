#!/usr/local/bin/perl

# This program is called with the -a and -n options.
while ($F[0] =~ /[^\d.]/) {
        shift (@F);
        next if (!defined($F[0]));
}
print ("$F[0] $F[1]\n");
