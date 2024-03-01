#!/usr/local/bin/perl

$level = 0;
$homedir = "/mnt/d/git repo/Teach_Yourself_Perl5_in_21_days/D12/test2";

&chmod_dir($homedir);

sub chmod_dir{
	my ($dirvar) = @_;
	opendir(MYDIR, $dirvar);
	my @filenames = readdir(MYDIR);
	closedir(MYDIR);
	foreach $filename (@filenames) {
		if($filename =~ /^\.{1,2}$/) {
			next; #ignore . ..
		}
		elsif(-d $dirvar.'/'.$filename) {
			&chmod_dir($dirvar.'/'.$filename);
		}
		elsif($filename =~ /\.pl$/) {
			chmod(0111, $dirvar.'/'.$filename);	
		}
	}
}
