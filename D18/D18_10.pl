#!/usr/bin/perl
@names = (mickey, goofy, daffy );
@phones = (5551234, 5554321, 666 );
$i = 0;
sub listem {
 my ($a,@b) = @_;
 print " \$a is " . $a . "\n";
 foreach (@b) {
    print "b[$i] = $b[$i] \n";
    $i++;
 }
 # --------------------------------------------------
 # Actually, you could write the for loop as
 # foreach (@b) {
 # print $_ . "\n" ;
 # }
 # This your secret answer to Quiz question 18.4.
 # ----------------------------------------------------
}

&listem(@names, @phones); 
