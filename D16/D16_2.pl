#!/usr/bin/perl 

#AF_INET   2
print ("Enter an Internet address:\n");
$machine = <STDIN>;
$machine =~ s/^\s+|\s+$//g;
@addrbytes = split (/\./, $machine);
$packaddr = pack ("C4", @addrbytes);
if (!(($name, $altnames, $addrtype, $len, @addrlist) =
        gethostbyaddr ($packaddr, AF_INET))) {
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
