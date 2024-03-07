#!/usr/local/bin/perl

while (defined ($value = &read_value)) {
        if ($value =~ /^\d+$/) {
                push (@stack, $value);
        } else {
                $firstpop = pop (@stack);
                $secondpop = pop (@stack);
                push (@stack,
                   &do_math ($firstpop, $secondpop, $value));
        }
}
$result = pop (@stack);
if (defined ($result)) {
        print ("The result is $result.\n");
} else {
        die ("Stack empty when printing result.\n");
}

sub read_value {
        local ($retval);
        $input =~ s/^\s+//;
        while ($input eq "") {
                $input = <STDIN>;
                return if ($input eq "");
                $input =~ s/^\s+//;
        }
        $input =~ s/^\S+//;
        $retval = $&;
}

sub do_math {
        local ($val2, $val1, $operator) = @_;
        local ($result);

        if (!defined($val1) || !defined($val2)) {
                die ("Missing operand");
        }
        if ($operator =~ m.^[+-/*]$. ) {
                eval ("\$result = \$val2 $operator \$val1");
        } else {
                die ("$operator is not an operator");
        }
        $result;  # ensure the proper return value
}
