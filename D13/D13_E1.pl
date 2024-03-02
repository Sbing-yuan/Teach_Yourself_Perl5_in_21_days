#!/usr/local/bin/perl

$retval = fork();
if ($retval != 0) {
         # this is the parent process
	waitpid($retval, 0);
	print("This line is from Parent\n");
} else {
        # this is the child process
	$child_val = fork();
	if($child_val != 0) {
		#child1 process	
		print("This line is from Child1\n");
	}
	else {
		#child2 process
		waitpid($child_val, 0);
		print("This line is from Child2\n");
	}
}
