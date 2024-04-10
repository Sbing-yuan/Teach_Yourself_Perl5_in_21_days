#/usr/local/bin/perl

package Mymodule;
require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(myfunc1 myfunc2);
@EXPORT_OK = qw($myvar1 $myvar2);

sub myfunc1 {
$myvar1 += 1;
}

sub myfunc2 {
$myvar2 += 2;
}
