#!/usr/local/bin/perl

$temp = 1;
@list = ("This", "is", "a", "list", "of", "words");
print ("Here are the words in the list: \n");
foreach $temp (@list) {
        print ("$temp ");
}
print("\n");
print("The value of temp is now $temp\n");
