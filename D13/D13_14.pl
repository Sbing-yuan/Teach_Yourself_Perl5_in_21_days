#!/usr/local/bin/perl

$string = "Here is a sample character string";
substr($string, 0, 4) = "This"; 	# This is a sample character string
substr($string, 8, 1) = "the"; 		# This is the sample character string
substr($string, 19) = "string";		# This is the sample string
substr($string, -1, 1) = "g.";		# This is the sample string.
substr($string, 0, 0) = "Behold! ";	# Behold! This is the sample string.
print ("$string\n");
