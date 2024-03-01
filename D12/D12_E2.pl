#!/usr/local/bin/perl

$level = 0;
$homedir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days";
#$homedir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/test";
&list_dir($homedir);

sub list_dir{
	my ($dirvar) = @_;
	opendir(MYDIR, $dirvar);
	my @filenames = readdir(MYDIR);
	closedir(MYDIR);
	$level += 1;
	foreach $filename (@filenames) {
		if($filename =~ /^\.{1,2}$/) {
			next; #ignore . ..
		}
		elsif(-d $dirvar.'/'.$filename) {
			print(("-----"x($level-1))."dir: $filename\n");
			&list_dir($dirvar.'/'.$filename);
		}
		else {
			print(("-----"x($level-1))."$filename\n");
		}
	}
	$level -= 1;
}
