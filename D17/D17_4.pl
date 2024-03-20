#!/usr/local/bin/perl

($username) = getpwuid($<);
print ("Hello, $username!\n");
