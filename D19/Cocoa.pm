package Cocoa;
#
# Put "require" statements in for all required,imported packages
#
#
# Just add code here
sub new {
    my $this = {};
    print "\n /* \n ** Created by Cocoa.pm \n ** Use at own risk";
    print "\n ** Did this code even get pass the javac compiler? ";
    print "\n **/ \n";
    bless $this;
    return $this;
}
#
1; # terminate the package with the required 1;
