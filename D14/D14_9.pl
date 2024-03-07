#!/usr/local/bin/perl

$total = 0;
$line = <STDIN>;
@words = split(/\s+/, $line);
@numbers = grep(/^\d+[.,;:]?$/, @words);
foreach $number (@numbers) {
        $total += $number;
}
print ("The total is $total.\n");
