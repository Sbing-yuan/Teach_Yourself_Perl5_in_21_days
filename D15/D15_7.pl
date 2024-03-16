#!/usr/local/bin/perl

$otherid = fork();
if ($otherid == 0) {
        # this is the child; retrieve parent ID
        $otherid = getppid();
} else {
        # this is the parent
}
