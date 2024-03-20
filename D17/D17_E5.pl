#!/usr/local/bin/perl

while($line = <DATA>) {
    while($line =~ s/\d+//) {
        $int = int($&);
        $sum += $int;
        print("$int\n");
    }
}
print("Sum: $sum\n");

__END__
This is my line of data. 123
This is my line of data. 456
This is my 789 of 33. 
