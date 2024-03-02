#!/usr/local/bin/perl

$input = <STDIN>;
$position = index($input, "the");
if ($position >= 0) {
        print ("pattern found at position $position\n");
} else {
        print ("pattern not found\n");
}
