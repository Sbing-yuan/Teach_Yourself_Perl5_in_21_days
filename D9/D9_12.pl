
#!/usr/local/bin/perl

$inputline = <STDIN>;
$inputline =~ s/^\s+|\s+$//g;
@list = split (/\s+/, $inputline);
$result = &rightcalc (0);
print ("The result is $result.\n");
sub rightcalc {
        my ($index) = @_;
        my ($result, $operand1, $operand2);
        if ($index+3 == @list) {
                $operand2 = $list[$index+2];
        } else {
                $operand2 = &rightcalc ($index+2);
        }
        $operand1 = $list[$index+1];
        if ($list[$index] eq "+") {
                $result = $operand1 + $operand2;
        } elsif ($list[$index] eq "*") {
                $result = $operand1 * $operand2;
        } elsif ($list[$index] eq "-") {
                $result = $operand1 - $operand2;
        } else {
                $result = $operand1 / $operand2;
        }
}
