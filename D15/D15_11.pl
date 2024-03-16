#!/usr/local/bin/perl

$line = "Hello, world!\n";

$port = 2000;
while (getservbyport ($port, "tcp")) {
        $port++;
}
($d1, $d2, $prototype) = getprotobyname ("tcp");
($d1, $d2, $d3, $d4, $rawserver) = gethostbyname ("silver");
$serveraddr = pack ("Sna4x8", 2, $port, $rawserver);
socket (SSOCKET, 2, 1, $prototype) || die ("No socket");
bind (SSOCKET, $serveraddr) || die ("Can't bind");
listen (SSOCKET, 1) || die ("Can't listen");
($clientaddr = accept (SOCKET, SSOCKET)) ||
        die ("Can't accept");
select (SOCKET);
$| = 1;
print SOCKET ("$line\n");
close (SOCKET);
close (SSOCKET);
