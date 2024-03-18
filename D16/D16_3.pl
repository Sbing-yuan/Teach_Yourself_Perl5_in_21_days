#!/usr/local/bin/perl -n

# input line is stored in the system variable $_
$line = $_;
chop ($line);
printf ("* %-52s *\n", $line);
