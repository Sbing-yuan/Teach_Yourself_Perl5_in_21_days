#!/usr/local/bin/perl

opendir(CURRDIR, ".") ||
        die("Can't open current directory");
@filelist = grep (!/^\./, grep(-r, readdir(CURRDIR)));
closedir(CURRDIR);
foreach $file (@filelist) {
        open (CURRFILE, $file) ||
                die ("Can't open input file $file");
        while ($line = <CURRFILE>) {
                if ($line =~ /$ARGV[0]/) {
                        print ("$file:$line");
                }
        }
        close (CURRFILE);
}
