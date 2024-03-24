sub new {
 my $this = {}; # Create an anonymous hash, and #self points to it.
 bless $this; # Connect the hash to the package Cocoa.
 return $this; # Return the reference to the hash.
 }
1;
