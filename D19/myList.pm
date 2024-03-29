package myList;

require Exporter;
@EXPORT = (List);

sub List {
    my ($dir) = @_;
    print `find $dir -depth -print`;
}

1;
