#!/usr/local/bin/perl

open (MYFILE, "file1") || die ("Can't open file1");
eval ("\$start = tell(MYFILE);");
if ($@ eq "") {
        print ("The tell function is defined.\n");
} else {
        print ("The tell function is not defined!\n");
}
