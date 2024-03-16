#!/usr/local/bin/perl

while (($gname, $passwd, $groupid, $userids) = getgrent()) {
    $garray{$gname} = $userids;
}

foreach $gname (sort keys (%garray)) {
    print("Group $gname:\n");
    @userids = split(/s+/, $garry{$gname});
    foreach $userid (sort (@userids)) {
        print("\t$userid\n");
    }
}
