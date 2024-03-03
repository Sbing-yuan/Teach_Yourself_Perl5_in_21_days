#!/usr/local/bin/perl

$integer = <STDIN>;
chop ($integer);
if ($integer !~ /^[0-9]+$|^0[xX][0-9a-fA-F]+$/) {
        die ("$integer is not a legal integer\n");
}
if ($integer =~ /^0/) {
        $integer = oct ($integer);
}
print ("$integer\n");
