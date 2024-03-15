#!/usr/local/bin/perl

print ("Networks this machine is connected to:\n");
while (($name, $altnames, $addrtype, $rawaddr) = getnetent()) {
        @addrbytes = unpack ("C4", $rawaddr);
        $address = join (".", @addrbytes);
        print ("$name, at address $address\n");
}
