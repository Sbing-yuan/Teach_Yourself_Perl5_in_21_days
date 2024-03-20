#!/usr/local/bin/perl

while(<>) {
    $str = $_;
    while($str =~ /\s{2,}/) {
        $str = $` . " " . $';    
    }
    print($str);
}
