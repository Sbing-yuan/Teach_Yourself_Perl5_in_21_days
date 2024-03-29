&makeCup();
&makeCup(1);
&makeCup(1,1);
&makeCup(1,1,1);
&makeCup(1,1,2,1);

sub makeCup {
    if(scalar(@_) == 0) {
        print "\n================================== \n";
        print "Making a Black Coffee \n";
        print "\n================================== \n";
        return;
    }
    my ($class, $cream, $sugar, $dope) = @_;
    print "\n================================== \n";
    print "Making a cup \n";
    print "Add cream \n" if ($cream);
    print "Add $sugar sugar cubes\n" if ($sugar);
    print "Making some really nice coffee ;-) \n" if ($dope);
    print "================================== \n";
}
