#!/usr/local/bin/perl

$P = $ENV{'PATH'};
@P = split(':', $P);
foreach $p (@P) {
    print($p, "\n");
}
