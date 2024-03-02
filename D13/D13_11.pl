 #!/usr/local/bin/perl
 
 $punctuation = $blanks = $total = 0;
 while ($input = <STDIN>) {
         chop ($input);
         $total += length($input);
         $_ = $input;
         $punctuation += tr/,:;.-/,:;.-/;
         $blanks += tr/ / /;
}
print ("In this file, there are:\n");
print ("\t$punctuation punctuation characters,\n");
print ("\t$blanks blank characters,\n");
print ("\t", $total - $punctuation - $blanks);
print (" other characters.\n");
