#!/usr/local/bin/perl

opendir(HOMEDIR, "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/test/") ||
        die ("Unable to open directory");
@files = readdir(HOMEDIR);
closedir(HOMEDIR);
foreach $file (sort @files) {
        print ("$file\n");
}
