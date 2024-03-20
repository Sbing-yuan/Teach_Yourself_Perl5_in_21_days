#!/usr/local/bin/perl

print ("Specify the nonblank characters you want to count:\n");
$countstring = <STDIN>;
chop ($countstring);
@chars = split (/\s*/, $countstring);
while ($input = <>) {
        $_ = $input;
        foreach $char (@chars) {
                eval ("\$count = tr/$char/$char/;");
                $count{$char} += $count;
        }
}
foreach $char (sort (@chars)) {
        print ("$char appears $count{$char} times\n");
}
