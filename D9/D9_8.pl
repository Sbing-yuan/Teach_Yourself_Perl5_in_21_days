#!/usr/local/bin/perl

$total = 0;
while (1) {
        $linetotal = &get_total;
        last if ($linetotal eq "done");
        print ("Total for this line: $linetotal\n");
        $total += $linetotal;
}
print ("Total for all lines: $total\n");
sub get_total {
	my ($total, $inputline, @subwords);
	my ($index, $retval);
        $total = 0;
        $inputline = <STDIN>;
        if ($inputline eq "") {
                return ("done");
        }
        $inputline =~ s/^\s+|\s*\n$//g;
        @subwords = split(/\s+/, $inputline);
        $index = 0;
        while ($subwords[$index] ne "") {
                $total += $subwords[$index++];
        }
        $retval = $total;
}
