#!/usr/local/bin/perl

$SIG{"INT"} = "interrupt";

while(1) {
    sleep(1);
    print("$i\n");
    $i += 1;
}

sub interrupt {
    local ($signal) = @_;
    print("Interrupted by the $signal signal.\n");
    exit(0);
}
