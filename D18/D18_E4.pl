#!/usr/bin/perl

@array1 = ('1', 'as', '2', 'bb', 'fd');
@array2 = ('0', 'tl', '4', 'fd', 'llld');

&rev_sort(\@array1, \@array2);

&print_arr(\@array1);
&print_arr(\@array2);
&print_arr(\@a_rev_sort);
&print_arr(\@b_rev_sort);

sub rev_sort() {
    my($a, $b) = @_;
    @a_rev_sort = reverse sort(@$a);
    @b_rev_sort = reverse sort(@$b);
}

sub print_arr() {
    my($a) = @_;
    foreach $i (@$a) {
        print "$i ";
    }
    print "\n";
}
