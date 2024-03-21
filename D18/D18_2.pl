#!/usr/bin/perl
#
# Using Associative Array references
#
%month = (
'01', 'Jan',
'02', 'Feb',
'03', 'Mar',
'04', 'Apr',
'05', 'May',
'06', 'Jun',
'07', 'Jul',
'08', 'Aug',
'09', 'Sep',
'10', 'Oct',
'11', 'Nov',
'12', 'Dec',
);

$pointer = \%month;

printf "\n Address of hash = $pointer\n ";

#
# The following lines would be used to print out the
# contents of the associative array if %month was used.
#
# foreach $i (sort keys %month) {
# printf "\n $i $$pointer{$i} ";
# }

#
# The reference to the associative array via $pointer
#
foreach $i (sort keys %$pointer) {
printf "$i is $$pointer{$i} \n";
}
