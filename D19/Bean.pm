package Bean;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(setBeanType printType printType);
sub new {
    my $type = shift;
    my $this = {};
    $this->{'Bean'} = 'Colombian';
    bless $this, $type;
    return $this;
}
#
# This subroutine sets the class name
sub setBeanType{
    my ($class, $name) = @_;
    $class->{'Bean'} = $name;
    print "Set bean to $name \n";
}
sub printType {
 my $class = shift @_;
  print "The type of Bean is $class->{'Bean'} \n";
}
1;
