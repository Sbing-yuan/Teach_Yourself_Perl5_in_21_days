#!/usr/local/bin/perl

%Eng_list;
%History_list;
%Math_list;
%Sci_list;
%Geo_list;
while($line = <STDIN>){
	$line =~ s/^\s+|\s+$//g;
	@words = split (/\s+/, $line);

	$Eng_list{$words[0]} 	= $words[1];
	$History_list{$words[0]}= $words[2];
	$Math_list{$words[0]} 	= $words[3];
	$Sci_list{$words[0]} 	= $words[4];
	$Geo_list{$words[0]} 	= $words[5];
}

foreach my $student (sort keys(%Eng_list)) {
	if($Eng_list{$student} < 50) 		{print("fail student: $student, English   fail grade: $Eng_list{$student}\n");}
	if($History_list{$student} < 50) 	{print("fail student: $student, History   fail grade: $History_list{$student}\n");}
	if($Math_list{$student} < 50) 		{print("fail student: $student, Math      fail grade: $Math_list{$student}\n");}
	if($Sci_list{$student} < 50) 		{print("fail student: $student, Science   fail grade: $Sci_list{$student}\n");}
	if($Geo_list{$student} < 50) 		{print("fail student: $student, Geography fail grade: $Geo_list{$student}\n");}
}
