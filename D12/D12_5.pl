#!/usr/local/bin/perl

while ($line = <>) {
        print ($line);
        if (eof()) {
                print ("-- end of output --\n");
        }
}
