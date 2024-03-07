#!/usr/local/bin/perl

$array[2] = 14;
$array[4] = "hello";
for ($i = 0; $i <= 5; $i++) {
        if (defined ($array[$i])) {
                print ("element ", $i+1, " is defined\n");
        }
}
