#!/usr/bin/perl

sub foo { print "foo\n"; }
sub bar { print "bar\n"; }
sub yuk { print "yuk\n"; }
sub huh { print "huh\n"; }
$foo = \&foo();
$bar = \&bar();
$yuk = \&yuk();
$huh = \&huh();

@list = ($foo, $bar, $yuk, $huh);

$list[0];
$list[1];
$list[2];
$list[3];
