#!/usr/local/bin/perl

$] =~ /Revision: ([0-9.]+)/;
$revision = $1;
$] =~ /Patch level: ([0-9]+)/;
$patchlevel = $1;
print ("revision $revision, patch level $patchlevel\n");
