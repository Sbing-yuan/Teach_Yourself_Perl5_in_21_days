#!/usr/local/bin/perl

$port = 2000;
while (getservbyport ($port, "tcp")) {
        $port++;
}
($d1, $d2, $prototype) = getprotobyname ("tcp");
($d1, $d2, $d3, $d4, $rawclient) = gethostbyname ("mercury");
($d1, $d2, $d3, $d4, $rawserver) = gethostbyname ("silver");
$clientaddr = pack ("Sna4x8", 2, 0, $rawclient);
$serveraddr = pack ("Sna4x8", 2, $port, $rawserver);
socket (SOCKET, 2, 1, $prototype) || die ("No socket");
bind (SOCKET, $clientaddr) || die ("Can't bind");
connect (SOCKET, $serveraddr);

$line = <SOCKET>;
print ("$line\n");
close (SOCKET);
