#!/usr/local/bin/perl

$otherid = fork();
if ($otherid == 0) {
    #child process
    $otherid = getppid();
}

$| = 1;
print("Process ID of ther other process $otherid\n");
