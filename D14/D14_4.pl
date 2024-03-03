#!/usr/local/bin/perl

@list_of_integers = (11, 26, 43);
$mystring = pack("i*", @list_of_integers);
@list_of_integers = unpack("i*", $mystring);
print ("@list_of_integers\n");
