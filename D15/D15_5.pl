#!/usr/local/bin/perl

print ("Enter a machine name or Internet site name:\n");
$machine = <STDIN>;
$machine =~ s/^\s+|\s+$//g;
if (!(($name, $altnames, $addrtype, $len, @addrlist) =
        gethostbyname ($machine))) {
        die ("Machine name $machine not found.\n");
}
print ("Equivalent addresses:\n");
for ($i = 0; $i < @addrlist; $i++) {
        @addrbytes = unpack("C4", $addrlist[$i]);
        $realaddr = join (".", @addrbytes);
        print ("\t$realaddr\n");
}
