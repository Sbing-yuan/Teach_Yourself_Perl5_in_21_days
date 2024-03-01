#!/usr/local/bin/perl

$dir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/test";
opendir(MYDIR, $dir);
while ($name = readdir(MYDIR)) {
        if (-l $dir . "/" . $name) {
                print ("$name is linked to ");
                print (readlink($dir . "/". $name) . "\n");
        }
}
closedir(MYDIR);
