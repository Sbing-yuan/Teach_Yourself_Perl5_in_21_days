#
# The Coffee.pm file to illustrate inheritance.
#
package Coffee;
require Exporter;
require Bean;
@ISA = qw(Exporter, Bean);
@EXPORT = qw(setImports, declareMain, closeMain);
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
1;
