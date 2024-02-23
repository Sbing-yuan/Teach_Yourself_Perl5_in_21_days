#!/usr/local/bin/perl

while ($inputline = <STDIN>) {
        while ($inputline =~ /\b[A-Z]\S+/g) {
                $word = $&;
                $word =~ s/[;.,:-]$//;  # remove punctuation
                $wordlist{$word} += 1;
        }
}
print ("Capitalized words and number of occurrences:\n");
foreach $capword (keys(%wordlist)) {
        print ("$capword: $wordlist{$capword}\n");
}
