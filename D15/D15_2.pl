#!/usr/local/bin/perl

print ("Enter the group name to list:\n");
$name = <STDIN>;
chop ($name);
if (!(($gname, $gpasswd, $gid, $gmembers) = getgrnam ($name))) {
        die ("Group $name does not exist.\n");
}
$userids = 0;
while (1) {
        last if ($gmembers eq "");
        ($userid, $gmembers) = split (/\s+/, $gmembers, 2);
        printf ("  %-20s", $userid);
        $userids++;
        if ($userids % 3 == 0) {
                print ("\n");
        }
}
if ($userids % 3 != 0) {
        print ("\n");
}
