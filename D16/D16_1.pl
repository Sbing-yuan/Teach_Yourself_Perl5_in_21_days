#!/usr/bin/perl -s

# This program prints information as specified by
# the following options:
# -u: print numeric user ID
# -U: print user ID (name)
# -g: print group ID
# -G: print group name
# -d: print home directory
# -s: print login shell
# -all: print everything (overrides other options)

$u = $U = $g = $G = $d = $s = 1 if ($all);
$whoami = "whoami";
chop ($whoami);
($name, $d1, $userid, $groupid, $d2, $d3, $d4,
        $homedir, $shell) = getpwnam ($whoami);
print ("user id: $userid\n") if ($u);
print ("user name: $name\n") if ($U);
print ("group id: $groupid\n") if ($g);
if ($G) {
        ($groupname) = getgrgid ($groupid);
        print ("group name: $groupname\n");
}
print ("home directory: $homedir\n") if ($d);
print ("login shell: $shell\n") if ($s);
