#!/usr/local/bin/perl

# define the strings used in printing
@digitword = ("", "one", "two", "three", "four", "five",
     "six", "seven", "eight", "nine");
@digit10word = ("", "ten", "twenty", "thirty", "forty",
     "fifty", "sixty", "seventy", "eighty", "ninety");
@teenword = ("ten", "eleven", "twelve", "thirteen", "fourteen",
    "fifteen", "sixteen", "seventeen", "eighteen", "nineteen");
@groupword = ("", "thousand", "million", "billion", "trillion",
    "quadrillion", "quintillion", "sextillion", "septillion",
    "octillion", "novillion", "decillion");

# read a line of input and remove all blanks, commas and tabs;
# complain about anything else
$inputline = <STDIN>;
chop ($inputline);
$inputline =~ s/[, \t]+//g;
if ($inputline =~ /[^\d]/) {
         die ("Input must be a number.\n");
}

# remove leading zeroes
$inputline =~ s/^0+//;
$inputline =~ s/^$/0/;  # put one back if they're all zero

# split into digits: $grouping contains the number of groups
# of digits, and $oddlot contains the number of digits in the
# first group, which may be only 1 or 2 (e.g., the 1 in 1,000)
@digits = split(//, $inputline);
if (@digits > 36) {
        die ("Number too large for program to handle.\n");
}
$oddlot = @digits % 3;
$grouping = (@digits-1) / 3;

# this loop iterates once for each grouping
$count = 0;
while ($grouping >= 0) {
        if ($oddlot == 2) {
                $digit1 = 0;
                $digit2 = $digits[0];
                $digit3 = $digits[1];
                $count += 2;
        } elsif ($oddlot == 1) {
                $digit1 = 0;
                $digit2 = 0;
                $digits = $digits[0];
                $count += 1;
        } else {      # regular group of three digits
                $digit1 = $digits[$count];
                $digit2 = $digits[$count+1];
                $digit3 = $digits[$count+2];
                $count += 3;
        }
        $oddlot = 0;
        if ($digit1 != 0) {
                print ("$digitword[$digit1] hundred ");
        }
        if (($digit1 != 0 || ($grouping == 0 && $count > 3)) &&
            ($digit2 != 0 || $digit3 != 0)) {
                print ("and ");
        }
        if ($digit2 == 1) {
                print ("$teenword[$digit3] ");
        } elsif ($digit2 != 0 && $digit3 != 0) {
                print ("$digit10word[$digit2]-$digitword[$digit3] ");
        } elsif ($digit2 != 0 || $digit3 != 0) {
                print ("$digit10word[$digit2]$digitword[$digit3] ");
        }
        if ($digit1 != 0 || $digit2 != 0 || $digit3 != 0) {
                print ("$groupword[$grouping]\n");
        } elsif ($count <= 3 && $grouping == 0) {
                print ("zero\n");
        }
        $grouping--;
}
