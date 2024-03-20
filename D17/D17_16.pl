#!/usr/local/bin/perl

$SIG{"INT"} = "wakeup";
sleep();

sub wakeup {
        print ("I have woken up!\n");
        exit();
}
