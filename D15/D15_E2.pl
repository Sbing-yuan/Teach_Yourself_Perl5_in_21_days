#!/usr/local/bin/perl

while(($name, $d1, $d2, $d3, $d4, $d5, $d6, $homedir) = getpwent()) {
    $dirlist{$name} = $homedir;
} 

foreach $name (sort keys (%dirlist)) {
    printf("userid %20s has home dir %s\n", $name, $dirlist{$name});
}
