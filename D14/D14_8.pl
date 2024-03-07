#!/usr/local/bin/perl

print ("Enter the number to divide:\n");
$value1 = <STDIN>;
chop ($value1);
print ("Enter the number to divide by:\n");
$value2 = <STDIN>;
chop ($value2);
$result = &safe_division($value1, $value2);
if (defined($result)) {
        print ("The result is $result.\n");
} else {
        print ("Can't divide by zero.\n");
}

sub safe_division {
        local ($dividend, $divisor) = @_;
        local ($result);

        $result = ($divisor == 0) ? undef :
                $dividend / $divisor;
}
