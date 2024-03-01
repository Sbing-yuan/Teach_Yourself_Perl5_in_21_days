#!/usr/local/bin/perl

open (WOUT, "w|");
$time = <WOUT>;
$time =~ s/^ *//;
$time =~ s/ .*//;
<WOUT>;   # skip headings line
@users = <WOUT>;
close (WOUT);
foreach $user (@users) {
        $user =~ s/ .*//;
}
print ("Current time:  $time");
print ("Users logged on:\n");
$prevuser = "";
foreach $user (sort @users) {
        if ($user ne $prevuser) {
                print ("\t$user");
                $prevuser = $user;
        }
}
