#!/usr/local/bin/perl

$total = &get_total;
print("The total is $total\n");
sub get_total {
        $value = 0;
        $inputline = <STDIN>;
        $inputline =~ s/^\s+|\s*\n$//g;
        @subwords = split(/\s+/, $inputline);
        $index = 0;
        while ($subwords[$index] ne "") {
                $value += $subwords[$index++];
        }
}
