#!/usr/local/bin/perl

#$homedir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/test";
#$homedir = "/mnt/c/git repo/Teach_Yourself_Perl5_in_21_days/test";
$homedir = "/mnt/c/git repo/Teach_Yourself_Perl5_in_21_days";

opendir(MYDIR, $homedir);

while (1) {
	while($file = readdir(MYDIR)) {
		if($file =~ /^\./) { #ignore files start with .
			next;	
		}
		elsif($curr_highest eq "") {
				$curr_highest = $file;
		}
		elsif($file gt $curr_highest  && $prev_highest eq "") {
				$curr_highest = $file;
		}
		elsif($file gt $curr_highest  && $prev_highest gt $file) {
				$curr_highest = $file;
		}
	}
	if($curr_highest eq $prev_highest) {
		last;
	}

	print("$curr_highest\n");
	$prev_highest = $curr_highest;
	$curr_highest = "";
	rewinddir(MYDIR);
}


#while($file = readdir(MYDIR)) {
#	print("$file\n");
#}


