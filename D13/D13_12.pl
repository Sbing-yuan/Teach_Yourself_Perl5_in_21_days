#!/usr/local/bin/perl

$string = "Mississippi";
while ($string =~ /i/g) {
        $position = pos($string);
        print("matched at position $position\n");
}
