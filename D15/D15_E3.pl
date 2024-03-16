#!/usr/local/bin/perl

while (@retval = getpwent()) {
    $retval[8] = "<null>" if ($retval[8] eq "");
    $shellarray{$retval[8]} += 1;
}

foreach $shell (sort count keys(%shellarray)) {
    printf("%-25s %5d %s\n", $shell, $shellarray{$shell},
          ($shellarray{$shell} == 1 ? "occurrence" : "occurrences"));
}

sub count {
    $shellarray{$b} <=> $shellarray{$a};
}
