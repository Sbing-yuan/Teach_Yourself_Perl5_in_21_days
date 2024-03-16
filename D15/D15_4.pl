#!/usr/local/bin/perl

print ("Enter an Internet address:\n");
$machine = <STDIN>;
$machine =~ s/^\s+|\s+$//g;
@bytes = split (/\./, $machine);
$packaddr = pack ("C4", @bytes);
if (!(($name, $altnames, $addrtype, $len, @addrlist) =
        gethostbyaddr ($packaddr, 2))) {
        die ("Address $machine not found.\n");
}
print ("Principal name: $name\n");
if ($altnames ne "") {
        print ("Alternative names:\n");
        @altlist = split (/\s+/, $altnames);
        for ($i = 0; $i < @altlist; $i++) {
                print ("\t$altlist[$i]\n");
        }
}
