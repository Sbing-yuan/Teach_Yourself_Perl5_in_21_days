#!/usr/local/bin/perl

$dir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/test";
opendir(MYDIR, $dir);

while ($filename = readdir(MYDIR)) {
	if ($filename =~ /^\.[^.]+/) {
		print("$filename\n");
	}
}

closedir(MYDIR);

