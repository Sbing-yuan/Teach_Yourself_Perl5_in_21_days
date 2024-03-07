#!/usr/local/bin/perl

open (FORM, "form") || die ("Can't open form letter");
@form = <FORM>;
close (FORM);
$name = <STDIN>;
@nameparts = split(/\s+/, $name);
foreach $line (@form) {
        @words = split(/\s+/, $line);
        $i = 0;
        while (1) {
                last if (!defined($words[$i]));
                if ($words[$i] eq "<name>") {
                        splice (@words, $i, 1, @nameparts);
                        $i += @nameparts;
                } elsif ($words[$i] =~ /^<name>/) {
                        $punc = $words[$i];
                        $punc =~ s/<name>//;
                        @temp = @nameparts;
                        $temp[@temp-1] .= $punc;
                        splice (@words, $i, 1, @temp);
                        $i += @temp;
                } else {
                        $i++;
                }
        }
        $line = join (" ", @words);
}
$i = 0;
while (1) {
        if (!defined ($form[$i])) {
                $~ = "FLUSH";
                write;
                last;
        }
        if ($form[$i] =~ /^\s*$/) {
                $~ = "FLUSH";
                write;
                $~ = "BLANK";
                write;
                $i++;
                next;
        }
        if ($writeline ne "" &&
                $writeline !~ / $/) {
                $writeline .= " ";
        }
        $writeline .= $form[$i];
        if (length ($writeline) < 60) {
                $i++;
                next;
        }
        $~ = "WRITELINE";
        write;
        $i++;
}
format WRITELINE =
^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<~
$writeline
.
format FLUSH =
^<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<~~
$writeline
.
format BLANK =

.
