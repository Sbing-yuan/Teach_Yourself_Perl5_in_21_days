require "sum.pl";

@input_arr = (); 

while($input = <STDIN>) {
    chop($input);
    push(@input_arr, int($input));
}

print("sum of input array: ");
print(&sum(\@input_arr));
print("\n");
