#What is wrong with the following program?
#!/usr/local/bin/perl
#$bitstring = "00000011";
#$packed = pack("b*", $bitstring);
#$highbit = vec($packed, 0, 1);
#print ("The high-order bit is $highbit\n");
$bitstring = "00000011";
$packed = pack("B*", $bitstring);
$highbit = vec($packed, 0, 1);
print ("The high-order bit is $highbit\n");
