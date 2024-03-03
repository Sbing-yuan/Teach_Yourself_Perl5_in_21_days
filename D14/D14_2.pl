#!/usr/local/bin/perl

open (PASSWD, "passwd") ||
        die ("Can't open password file");
$passwd = <PASSWD>;
chop ($passwd);
close (PASSWD);
print ("Enter the password for this program:\n");
system ("stty -echo");
$mypasswd = <STDIN>;
system ("stty echo");
chop ($mypasswd);
if (crypt ($mypasswd, substr($passwd, 0, 2)) eq $passwd) {
        print ("Correct! Carry on!\n");
} else {
        die ("Incorrect password: goodbye!\n");
}
