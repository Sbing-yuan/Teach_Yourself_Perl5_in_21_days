#What is wrong with the following statement?
#if ($line =~ /abc/) {
#    $' =~ s/ +/ /;
#}  -> $' is read only

$line = '  1   43   6 7  abc 1   43   6 7';
print("Before: $line\n");

if ($line =~ /abc/) {
    $head = $`;
    $middle = $&;
    $tail = $';
    $tail =~ s/ +/ /g;
    $line = $head . $middle . $tail;
    #$line = $` . $& . $';
}

print("After : $line\n");
