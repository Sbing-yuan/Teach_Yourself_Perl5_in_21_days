#What is wrong with the following program?
#!/usr/local/bin/perl
#print ("Here is a line of output. ");
#system ("w");
#print ("Here is the rest of the line.\n");
print ("Here is a line of output. ");
$| = 1;
system ("w");
print ("Here is the rest of the line.\n");
