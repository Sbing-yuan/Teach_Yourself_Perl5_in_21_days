#!/usr/local/bin/perl

while (1) {
        last unless (($username, $password, $userid)
                      = getpwent());
        $userlist{$username} = $userid;
}
print ("Users known to this machine:\n");
foreach $user (sort keys (%userlist)) {
        printf ("%-20s %d\n", $user, $userlist{$user});
}
