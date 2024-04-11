#!/usr/local/bin/perl -s

# get port from command line, or use 2000 as default
if ($#ARGV == -1) {
        $port = 2000;
} else {
        $port = $ARGV[0];
}
if (getservbyport($port, "tcp")) {
        die ("can't access port $port\n");
}

# initialization stuff
$nextport = $port + 1;
$maxclient = 0;

# establish main socket connection:  clients use this to
# get ports for their own connections
($d1, $d2, $prototype) = getprotobyname ("tcp");
$hostname = 'hostname';
chop ($hostname);
($d1, $d2, $d3, $d4, $serverraddr) = gethostbyname ($hostname);
$serveraddr = pack ("Sna4x8", 2, $port, $serverraddr);
socket (SSOCKET, 2, 1, $prototype) ||
        die ("No main server socket\n");
bind (SSOCKET, $serveraddr) ||
        die ("Can't bind main server socket\n");
listen (SSOCKET, 5) ||
        die ("Can't listen on main server socket\n");
select (STDOUT);
$| = 1;

while (1) {
        # listen for clients
        ($clientaddr = accept (SOCKET, SSOCKET)) ||
                die ("Can't accept connection to main socket\n");
        select (SOCKET);
        $| = 1;
        # find ports for new client
        $recvport = $nextport;
        while (getservbyport($recvport, "tcp")) {
                $recvport++;
        }
        $nextport = $recvport + 1;
        print SOCKET ("$recvport\n");
        $sendport = $nextport;
        while (getservbyport($sendport, "tcp")) {
                $sendport++;
        }
        $nextport = $sendport + 1;
        # send ports to client
        print SOCKET ("$sendport\n");
        print SOCKET ("$$\n");
        close (SOCKET);
        # now connect for this client: first receive, then send
        socket (C1SOCKET, 2, 1, $prototype) ||
                die ("No receive client socket\n");
        $msgaddr = pack ("Sna4x8", 2, $recvport, $serverraddr);
        bind (C1SOCKET, $msgaddr) ||
                die ("Can't bind receive client\n");
        listen (C1SOCKET, 1) ||
                die ("Can't listen for receive client\n");
        $rsockname = "CRSOCKET" . $maxclient;
        ($clientaddr = accept ($rsockname, C1SOCKET)) ||
                die ("Can't accept receive client\n");
        socket (C2SOCKET, 2, 1, $prototype) ||
                die ("No send client socket\n");
        $msgaddr = pack ("Sna4x8", 2, $sendport, $serverraddr);
        bind (C2SOCKET, $msgaddr) ||
                die ("Can't bind send client\n");
        listen (C2SOCKET, 1) ||
                die ("Can't listen for send client\n");
        $ssockname = "CSSOCKET" . $maxclient;
        ($clientaddr = accept ($ssockname, C2SOCKET)) ||
                die ("Can't accept send client\n");
        select ($ssockname);
        $| = 1;
        # when a new client is created, we have to kill all the
        # existing children and start new ones, so that all
        # of the sockets are known to all of the clients
        for ($i = 0; $i <= $maxclient-1; $i++) {
                kill (2, $procids[$i]);
        }
        for ($i = 0; $i <= $maxclient; $i++) {
                if ($child = fork()) {
                        # parent: continue forking
                        $procids[$i] = $child;
                } else {
                        # child: communicate with this client
                        &talk_to_client ($i, $maxclient);
                        exit(0);
                }
        }
        # once we're done forking, go back and listen for
        # more clients
        $maxclient += 1;
}

sub talk_to_client {
         local ($clientnum, $maxclient) = @_;
         local ($msg, $i, $count, $rsockname, $sockname);
 
         # get read socket for this client
         $rsockname = "CRSOCKET" . $clientnum;
         while (1) {
                 $msg = <$rsockname>;
                 last if ($msg eq "quit");
                 if ($m) {
                         select (STDOUT);
                         print ("$msg");
                 }
 
                 # send message to all other clients
                 for ($i = 0; $i <= $maxclient; $i++) {
                         $sockname = "CSSOCKET" . $i;
                         select ($sockname);
                         print ("$msg");
                 }
         }
 }
