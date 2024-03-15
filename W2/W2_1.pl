   #!/usr/local/bin/perl
   
   $dircount = 0;
   $curdir = "";
   while (1) {
           # if we don't have a current directory, get one
           if ($curdir eq "") {
                   print ("Enter directory to list:\n");
                   $curdir = <STDIN>;
                  $curdir =~ s/^\s+|\s+$//g;
                  $curdir = &followlink($curdir);
                  &readsubdirs($curdir);
          }
          $curdir = &menudir($curdir);
  }
  
  
  # Find all subdirectories of the given directory,
  # and store them in an associative array.
  #
  # The associative array subscripts and values are: 
  # <directory name>:       1
  #       (indicates that directory has been read)
  # <directory name>.<num>  the <num>th subdirectory
  
  sub readsubdirs {
          local ($dirname) = @_;
          local ($dirvar, $subdircount, $name, $index);
  
          # open the current directory;
          # $dircount ensures that each file variable is unique
          $dirvar = "DIR" . ++$dircount;
          if (!opendir ($dirvar, $dirname)) {
                  warn ("Can't open $dirname\n");
                  return;
          }
  
          # read all the subdirectories; store in a standard array
          chdir ($dirname);
          $subdircount = 0;
          while ($name = readdir ($dirvar)) {
                  next if ($name eq ".");
                  if ($dirname eq "/") {
                          $name = $dirname . $name;
                  } else {
                          $name = $dirname . "/" . $name;
                  }
                  if (-d $name) {
                          $dirarray[$subdircount++] = $name;
                  }
          }
          closedir ($dirvar);
  
          # sort the standard array; assign the sorted array to the
          # associative array
          @dirarray = sort (@dirarray);
          for ($index = 0; $index < $subdircount; $index++) {
                  $dirarray {$dirname . $index} = $dirarray[$index];
          }
          undef (@dirarray);
          $dirarray{$dirname} = 1;
  }
  
  
  # Display the subdirectories of the current directory and the
  # available menu options.
  
  sub menudir {
          local ($curdir) = @_;
          local ($base) = 0;
          local ($command, $count, $subdir);
  
          while (1) {
                  print ("\nCurrent directory is: $curdir\n");
                  print ("\nSubdirectories:\n");
                  if ($base > 0) {
                          print ("<more up>\n");
                  }
                  for ($count=0; $count<10; $count++) {
                          $subdir = $count+$base;
                          $subdir = $dirarray{$curdir.$subdir};
                          last if ($subdir eq "");
                          print ("$count: $subdir\n");
                  }
                  if ($dirarray{$curdir.($base+10)} ne "") {
                          print ("<more down>\n");
                  }
                  print ("\nEnter a number to move to the ");
                  print ("specified directory,\n");
                  if ($base > 0) {
                          print ("enter < to move up in the list,\n");
                  }
                  if ($dirarray{$curdir.($base+10)} ne "") {
                          print ("enter > to move down in the list,\n");
                  }
                  print ("enter d to display the files,\n");
                  print ("enter e to specify a new directory,\n");
                  print ("or enter q to quit entirely.\n");
                  print ("> ");
                 $command = <STDIN>;
                 $command =~ s/^\s+|\s+$//g;
                 if ($command eq "q") {
                         exit (0);
                 } elsif ($command eq ">") {
                         if ($dirarray{$curdir.($base+10)} ne "") {
                                 $base += 10;
                         }
                 } elsif ($command eq "<") {
                         $base -= 10 if $base > 0;
                 } elsif ($command eq "d") {
                         &display ($curdir);
                 } elsif ($command eq "e") {
                         # set the current directory to "" to force
                         # the main program to prompt for a name
                         return ("");
                 } elsif ($command =~ /^\d+$/) {
                         $subdir = $dirarray{$curdir.($command+$base)};
                         # if subdirectory is the parent directory,
                         # remove .. and the last directory name
                         # from the path
                         if ($subdir =~ /\.\.$/) {
                                 $subdir =~ s#(.*)/.*/..#$1#;
                         }
                         # if subdirectory is defined, it becomes
                         # the new current directory
                         if ($subdir ne "") {
                                 if ($dirarray{$subdir} != 1) {
                                        $subdir = &followlink($subdir);
                                        &readsubdirs ($subdir);
                                 }
                                 return ($subdir);
                         }
                 } else {
                         warn ("Invalid command $command\n");
                 }
         }
 }
 
 
 # Display the files in a directory, three per line.
 
 sub display {
         local ($dirname) = @_;
         local ($file, $filecount, $printfile);
         local (@filelist);
 
         if (!opendir(LOCALDIR, "$dirname")) {
                 warn ("Can't open $dirname\n");
                 return;
         }
         chdir ($dirname);
         print ("\n\nFiles in directory $dirname:\n");
         $filecount = 0;
         while ($file = readdir (LOCALDIR)) {
                 next if (-d $file);
                 $filelist[$filecount++] = $file;
         }
         closedir ($dirname);
         if ($filecount == 0) {
                 print ("\tDirectory contains no files.\n");
                 return;
         }
         @filelist = sort(@filelist);
         $filecount = 0;
         foreach $printfile (@filelist) {
                 if ($filecount == 30) {
                         print ("<Press return to continue>");
                         <STDIN>;
                         $filecount = 0;
                 }
                 if ($filecount % 3 == 0) {
                         print ("\t");
                 }
                 printf ("%-20s", $printfile);
                 $filecount += 1;
                 if ($filecount % 3 == 0) {
                         print ("\n");
                 }
         }
 }
 
 
 # Check whether the directory name is really a symbolic link.
 # If it is, find the real name and use it.
 
 sub followlink {
         local ($dirname) = @_;
 
         if (-l $dirname) {
                 $dirname = readlink ($dirname);
         }
         $dirname;        # return value
 }
