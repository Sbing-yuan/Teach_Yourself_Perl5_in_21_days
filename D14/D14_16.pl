#!/usr/local/bin/perl

open (PIPE, "bash numbers|") ||
        die ("Can't open pipe");
$result = 0;
while (defined ($value = &readnum)) {
        $result += $value;
}
print ("The result is $result.\n");

sub readnum {
        local ($line, @numbers, $retval);
        while ($queue[0] eq "") {
                $line = <PIPE>;
                last if ($line eq "");
                $line =~ s/^\s+//;
                @numbers = split (/\s+/, $line);
                push (@queue, @numbers);
        }
        $retval = shift(@queue);
}
