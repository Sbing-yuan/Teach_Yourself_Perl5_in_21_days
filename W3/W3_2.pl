#!/usr/local/bin/perl

# obtain the server port from the command line;
# use 2000 as the default
if ($#ARGV == -1) {
        $servport = 2000;
} else {
        $servport = $ARGV[0];
}
 
 # obtain the server machine name from the command line;
 # use "silver" as the default
 if ($#ARGV < 1) {
         $servname = "silver";
 } else {
         $servname = $ARGV[1];
 }
 # establish socket connection with server to obtain
 # ports for this client
 if (getservbyport($servport, "tcp")) {
         die ("can't access port $servport\n");
 }
 ($d1, $d2, $prototype) = getprotobyname ("tcp");
 $hostname = 'hostname';
 chop ($hostname);
 ($d1, $d2, $d3, $d4, $clientraddr) = gethostbyname ($hostname);
 ($d1, $d2, $d3, $d4, $serverraddr) = gethostbyname ($servname);
 $clientaddr = pack ("Sna4x8", 2, 0, $clientraddr);
 $serveraddr = pack ("Sna4x8", 2, $servport, $serverraddr);
 socket (SOCKET, 2, 1, $prototype) ||
         die ("No server socket\n");
 bind (SOCKET, $clientaddr) ||
         die ("Can't bind server socket\n");
 connect (SOCKET, $serveraddr) ||
         die ("Can't connect to server\n");
 $sendport = <SOCKET>;
 $recvport = <SOCKET>;
 $serverid = <SOCKET>;
 close (SOCKET);
 chop ($sendport);
 chop ($recvport);
 
 # use returned ports to create sockets for this client:
 # first socket is send, the second is receive
 $conncaddr = pack ("Sna4x8", 2, 0, $clientraddr);
 $connsaddr = pack ("Sna4x8", 2, $sendport, $serverraddr);
 socket (SSOCKET, 2, 1, $prototype) ||
         &nuke ("No send socket");
 bind (SSOCKET, $conncaddr) ||
         &nuke ("Can't bind send socket");
 connect (SSOCKET, $connsaddr) ||
         &nuke ("Can't connect to send socket");
 $connraddr = pack ("Sna4x8", 2, $recvport, $serverraddr);
 socket (RSOCKET, 2, 1, $prototype) ||
         &nuke ("No receive socket");
 bind (RSOCKET, $conncaddr) ||
         &nuke ("Can't bind receive socket");
 connect (RSOCKET, $connraddr) ||
         &nuke ("Can't connect to receive socket");
 select (SSOCKET);
 $| = 1;
 select (STDOUT);
 $| = 1;
 
 # now, we're ready to go:  prompt for user name
 select (STDOUT);
 print ("Welcome to chat!  Who are you? ");
 $username = <STDIN>;
 chop ($username);
 print ("Type 'quit' to exit chat.\n");
 $child = fork();
 if ($child == 0) {
         # child: receive messages
         &receive_msgs();
         exit(0);
 }
 # parent: send messages
 while (1) {
         # prompt for message
         select (STDOUT);
         $msg = <STDIN>;
         chop ($msg);
         # send message to server
         select (SSOCKET);
         if ($msg eq "quit") {
                 print ($msg);
                 last;
         }
         if ($msg !~ /^\s*$/) {
                 print ($username . ": " . $msg . "\n");
         }
 }
 kill (9, $child);
 close (RSOCKET);
 close (SSOCKET);
 
 sub receive_msgs {
         local ($msg);
 
         while (1) {
                 $msg = <RSOCKET>;
                 select (STDOUT);
                 print ("$msg");
         }
 }
 
 sub nuke {
         local ($errmsg) = @_;
 
         kill (-9, $serverid);
         die ("$errmsg\n");
 }
