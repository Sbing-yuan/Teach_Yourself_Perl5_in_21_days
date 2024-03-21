#!/usr/bin/perl
#
# Using Array references
#
%weekday = (
'01' => 'Mon',
'02' => 'Tue',
'03' => 'Wed',
'04' => 'Thu',
 '05' => 'Fri',
 '06' => 'Sat',
 '07' => 'Sun',
 );
 $pointer = \%weekday;
 $i = '05';
 printf "\n ================== start test ================= \n";
 #
 # These next two lines should show an output
 #
 printf '$$pointer{$i} is ';
 printf "$$pointer{$i} \n";
 printf '${$pointer}{$i} is ';
 printf "${$pointer}{$i} \n";
 printf '$pointer->{$i} is ';

 printf "$pointer->{$i}\n";
 #
 # These next two lines should not show anything
 #
 printf '${$pointer{$i}} is ';
 printf "${$pointer{$i}} \n";
 printf '${$pointer->{$i}} is ';
 printf "${$pointer->{$i}}";
 printf "\n ================== end of test ================= \n";

