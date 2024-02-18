#!/usr/local/bin/perl

$total = &get_total;
if ($total eq "error") {
        print ("No input supplied.\n");
} else {
        print("The total is $total.\n");
}
sub get_total {
        $value = 0;
        $inputline = <STDIN>;
        $inputline =~ s/^\s+|\s*\n$//g;
        if ($inputline eq "") {
                return ("error");
        }
        @subwords = split(/\s+/, $inputline);
        $index = 0;
        while ($subwords[$index] ne "") {
                $value += $subwords[$index++];
        }
	$retval = $value;
}
