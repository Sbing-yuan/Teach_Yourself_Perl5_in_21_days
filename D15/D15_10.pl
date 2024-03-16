#!/usr/local/bin/perl

print ("You're not in a hurry today, are you?\n");
$username = getlogin();
($username, $password, $userid) = getpwnam ($username);
$oldpriority = getpriority (2, $userid);
setpriority (2, $userid, $oldpriority + 1);
