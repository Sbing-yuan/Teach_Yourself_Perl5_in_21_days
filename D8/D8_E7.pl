#What is wrong with the following code?
$count = 1;
do {
print ("$count\n");
last if ($count == 10); #--> do while do not supprt last, redo, next
$count++;
} while (1);

