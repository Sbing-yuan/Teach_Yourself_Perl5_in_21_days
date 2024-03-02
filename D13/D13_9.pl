 #!/usr/local/bin/perl
 
 $wordcount = $charcount = 0;
 while ($line = <STDIN>) {
         @words = split(/\s+/, $line);
         foreach $word (@words) {
                 next if ($word =~ /^\d+\.?\d+$/);
                 $word =~ s/[,.;:]$//;
                 $wordcount += 1;
                $charcount += length($word);
        }
}
print ("Average word length: ", $charcount / $wordcount, "\n");
