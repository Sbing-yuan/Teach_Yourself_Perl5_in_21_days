#!/usr/local/bin/perl

while ($line = <STDIN>) {
        @words = split(/\s+/, $line);
        $i = 0;
        while (defined($words[$i])) {
                if (length($words[$i]) > 5) {
                        splice(@words, $i, 1);
                } else {
                        $i++;
                }
        }
        $line = join (" ", @words);
        print ("$line\n");
}
