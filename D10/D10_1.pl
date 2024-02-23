#!/usr/local/bin/perl

while ($inputline = <STDIN>) {
        while ($inputline =~ /\b[A-Z]\S+/g) {
                $word = $&;
                $word =~ s/[;.,:-]$//;  # remove punctuation
                for ($count = 1; $count <= @wordlist;
                                 $count++) {
                        $found = 0;
                        if ($wordlist[$count-1] eq $word) {
                                $found = 1;
                                $wordcount[$count-1] += 1;
                                last;
                        }
                }
                if ($found == 0) {
                        $oldlength = @wordlist;
                        $wordlist[$oldlength] = $word;
                        $wordcount[$oldlength] = 1;
                }
        }
}
print ("Capitalized words and number of occurrences:\n");
for ($count = 1; $count <= @wordlist; $count++) {
        print ("$wordlist[$count-1]: $wordcount[$count-1]\n");
}
