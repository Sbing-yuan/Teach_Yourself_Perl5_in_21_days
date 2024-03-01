#!/usr/local/bin/perl

while ($line = <>) {
        print ($line);
        if (eof) {
                print ("-- end of current file --\n");
        }
}
