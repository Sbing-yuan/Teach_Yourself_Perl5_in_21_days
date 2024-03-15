#!/usr/local/bin/perl

while (($gname, $gpasswd, $gid, $gmembers) = getgrent) {
        $garray{$gname} = $gmembers;
}
foreach $gname (sort keys (%garray)) {
        print ("Userids belonging to group $gname:\n");
        $gmembers = $garray{$gname};
        $userids = 0;
        while (1) {
                last if ($gmembers eq "");
                ($userid, $gmembers) =
                     split (/\s+/, $gmembers, 2);
                printf ("  %-20s", $userid);
                $userids++;
                if ($userids % 3 == 0) { 
                        print ("\n");
                }
        }
        if ($userids % 3 != 0) {
                print ("\n");
        }
}
