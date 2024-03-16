#!/usr/local/bin/perl

$pgroup = getpgrp (0);
print ("The process group for this program is $pgroup.\n");
