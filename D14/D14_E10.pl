#What is wrong with the following subroutine?
#sub retrieve_first_element {
#local ($retval);
#
#$retval = unshift(@array);
#}

@array = (1, 2, 3, 4);

print(&retrieve_first_element());
print(&retrieve_first_element());
print(&retrieve_first_element());
print(&retrieve_first_element());

sub retrieve_first_element {
local ($retval);

$retval = shift(@array);
}
