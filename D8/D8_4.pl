#!/usr/local/bin/perl

for ($line = <STDIN>, $count = 1; $count <= 3;
     $line = <STDIN>, $count++) {
        print ($line);
}
