 #!/usr/local/bin/perl
 
 $procid = fork();
 if ($procid == 0) {
         # this is the child process
         print ("this line is printed first\n");
         exit(0);
 } else {
         # this is the parent process
        waitpid ($procid, 0);
        print ("this line is printed last\n");
}
