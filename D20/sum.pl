sub sum {
    my $sum = 0;
    my ($arr_ref) = @_;    

    for $i (@$arr_ref) {
        #print("elem: $i \n");
        $sum += $i; 
    }
    return $sum;
}
1;
