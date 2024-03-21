#!/usr/bin/perl
@names = (mickey, goofy, daffy );
@phones = (5551234, 5554321, 666 );
$i = 0;
sub listem {
my (@a,@b) = @_;
foreach (@a) {
print "a[$i] = ". $a[$i] . " " . "\tb[$i] = " . $b[$i] . "\n";
$i++;
}
}
&listem(@names, @phones);
