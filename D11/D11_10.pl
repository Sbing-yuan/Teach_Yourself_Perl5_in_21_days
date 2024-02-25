#!/usr/local/bin/perl

$string = "Here\nis an unbalanced line of\ntext.\n";
$~ = "OUTLINE";
write;

format OUTLINE =
^<<<<<<<<<<<<<<<<<<<<<<<<<<<
$string
.
