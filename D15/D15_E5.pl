#!/usr/local/bin/perl

$port = 2000;
while (getservbyport($port, "tcp")) {
    $port++;
}

($d1, $d2, $prototype) = getprotobyname ("tcp");
# in the following, replace "silver" with the name
# of your machine
($d1, $d2, $d3, $d4, $rawaddr) = gethostbyname ("silver");
$serveraddr = pack ("Sna4x8", 2, $port, $rawaddr);
socket (SSOCKET, 2, 1, $prototype) || die ("No socket");
bind (SSOCKET, $serveraddr) || die ("Can't bind");
listen (SSOCKET, 5) || die ("Can't listen");
while (1) {
    ($clientaddr = accept (SOCKET, SSOCKET))  || die ("Can't accept");
    if (fork() == 0) {
         select (SOCKET);
         $| = 1;
         open (MYFILE, "testfile");
         while ($line = <MYFILE>) {
            print SOCKET ($line);
        }
        close (MYFILE);
        close (SOCKET);
        exit (0);
        }
}
