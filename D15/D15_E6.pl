#What is wrong with the following program?
#!/usr/local/bin/perl

#print ("Network names and numbers at your site:\n");
#while (($name, $d1, $d2, $address) = getnetent()) {
#print ("$name, at address $address\n");
#}

print ("Network names and numbers at your site:\n");
while (($name, $d1, $d2, $address) = getnetent()) {
    @address_byte = unpack("C4", $address);
    $my_address = join('.', @address_byte);
    print ("$name, at address $my_address\n");
}
