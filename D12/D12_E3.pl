#!/usr/local/bin/perl

$homedir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/test";

opendir(MYDIR, $homedir);

for (my $i=0; $i<10; $i++) {
	while($file = readdir(MYDIR)) {
		if($file =~ /^\./) { #ignore files start with .
			next;	
		}
		elsif($curr_highest eq "") {
			$curr_highest = ($file gt $prev_highest) ? $curr_highest : $file;
		}
		elsif($file gt $curr_highest) {
			if($prev_highest eq "") {
				$curr_highest = $file;	
			}
			else {
				$curr_highest = ($file gt $prev_highest) ? $curr_highest : $file;		
			}
		}
		elsif($curr_highest gt $file) {
			$curr_highest = ($file gt $prev_highest) ? $curr_highest : $file;		
		}
	}
	print("$curr_highest\n");
	$prev_highest = $curr_highest;
	$curr_highest = "";
	rewinddir(MYDIR);
}
