#!/usr/local/bin/perl

while ($line = <>) {
        while ($line =~ /\d/g) {
              $digitcount[$&]++;
        }
}
print ("Totals for each digit:\n");
for ($i = 0; $i <= 9; $i++) {
        print ("$i: $digitcount[$i]\n");
}
