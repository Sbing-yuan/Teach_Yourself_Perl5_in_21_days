#!/usr/local/bin/perl

print ("Enter the last number in the sum:\n");
$limit = <STDIN>;
chop ($limit);
$count = 1;
$total = $eventotal = 0;
for ($count = 1; $count <= $limit; $count++) {
        $total += $count;
        if ($count % 2 == 1) {
                # start the next iteration if the number is odd
                next;
        }
        $eventotal += $count;
}
print("The sum of the numbers 1 to $limit is $total\n");
print("The sum of the even numbers is $eventotal\n");
