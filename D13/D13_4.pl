#!/usr/local/bin/perl

pipe (INPUT, OUTPUT);
$retval = fork();
if ($retval != 0) {
         # this is the parent process
         close (INPUT);
         print ("Enter a line of input:\n");
         $line = <STDIN>;
        print OUTPUT ($line);
} else {
        # this is the child process
        close (OUTPUT);
        $line = <INPUT>;
        print ($line);
        exit (0);
}
