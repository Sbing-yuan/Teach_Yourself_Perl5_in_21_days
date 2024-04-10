package privpack;
$valtoprint = 46;

package main;
# This function is the link to the outside world.
sub printval {
&privpack::printval();
}

package privpack;
sub printval {
print ("$valtoprint\n");
}

package main;
1; # return value for require
