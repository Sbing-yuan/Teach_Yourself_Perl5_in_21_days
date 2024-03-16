#!/usr/local/bin/perl

print ("Enter a username:\n");
$username = <STDIN>;
$username =~ s/^\s+|\s+$//g;
if (($username, $passwd, $userid) = getpwnam ($username)) {
        print ("Username $username has user id $userid.\n");
} else {
        print ("Username not found.\n");
}
