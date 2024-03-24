#
# The Coffee.pm file to illustrate inheritance.
#
package Coffee;
require Exporter;
require Bean;
@ISA = qw(Exporter, Bean);
@EXPORT = qw(setImports, declareMain, closeMain, printType);
#
# set item
#
sub setCoffeeType{
my ($class,$name) = @_;
$class->{'Coffee'} = $name;
print "Set coffee type to $name \n";
}
#
# constructor
#
sub new {
my $type = shift;
my $this = Bean->new(); ##### <- LOOK HERE!!! ####
$this->{'Coffee'} = 'Instant'; # unless told otherwise
bless $this, $type;
return $this;
}
sub makeCup {
    my ($class, $cream, $sugar, $dope) = @_;
    print "\n================================== \n";
    print "Making a cup \n";
    print "Add cream \n" if ($cream);
    print "Add $sugar sugar cubes\n" if ($sugar);
    print "Making some really addictive coffee ;-) \n" if ($dope);
    print "================================== \n";
}
#
# This routine prints the type of $class->{'Coffee'}
#
sub printType {
    my $class = shift @_;
    print "The type of Coffee is $class->{'Coffee'} \n";
}
1;
