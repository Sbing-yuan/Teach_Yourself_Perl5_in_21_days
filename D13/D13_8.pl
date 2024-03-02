 #!/usr/local/bin/perl
 
 $input = <STDIN>;
 $position = $found = 0;
 while (1) {
         $position = index($input, "the", $position);
         last if ($position == -1);
         if ($found == 0) {
                 $found = 1;
                print ("pattern found - characters skipped:");
        }
        print (" $position");
        $position++;
}
if ($found == 0) {
        print ("pattern not found\n");
} else {
        print ("\n");
}
