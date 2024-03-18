Here is a Perl program that appears in the middle
of a file.
The stuff up here is junk, and the Perl interpreter
will ignore it.
The next line is the start of the actual program.
#!/usr/local/bin/perl

print ("Hello, world!\n");
__END__
This line is also ignored, because it is not part
of the program.
