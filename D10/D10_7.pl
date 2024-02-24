#!/usr/local/bin/perl
# statements which initialize the program
$nextnodenum = 1;  # initialize node name generator
&get_next_item;    # read first value from file
$treeroot = &build_expr;
$result = &get_result ($treeroot);
print ("the result is $result\n");
# Build an expression.
sub build_expr {
        local ($currnode, $leftchild, $rightchild);
        local ($operator);
        $leftchild = &build_add_operand;
        if (&is_next_item("+") || &is_next_item("-")) {
                $operator = &get_next_item;
                $rightchild = &build_expr;
                $currnode = &get_new_node ($operator,
                        $leftchild, $rightchild);
        } else {
                $currnode = $leftchild;
        }
}
# Build an operand for a + or - operator.
sub build_add_operand {
        local ($currnode, $leftchild, $rightchild);
        local ($operator);
        $leftchild = &build_mult_operand;
        if (&is_next_item("*") || &is_next_item("/")) {
                $operator = &get_next_item;
                $rightchild = &build_add_operand;
                $currnode = &get_new_node ($operator,
                        $leftchild, $rightchild);
       } else {
                $currnode = $leftchild;
       }
}
# Build an operand for the * or / operator.
sub build_mult_operand {
        local ($currnode);
        if (&is_next_item("(")) {
                # handle parentheses
               &get_next_item;  # get rid of "("
                $currnode = &build_expr;
                if (! &is_next_item(")")) {
                        die ("Invalid expression");
                }
                &get_next_item;  # get rid of ")"
        } else {
                $currnode = &get_new_node(&get_next_item,
                            "", "");
       }
       $currnode;  # ensure correct return value
}
# Check whether the last item read matches
# a particular operator.
sub is_next_item {
        local ($expected) = @_;
        $curritem eq $expected;
}
# Return the last item read; read another item.
sub get_next_item {
        local ($retitem);
        $retitem = $curritem;
        $curritem = &read_item;
        $retitem;
}
# This routine actually handles reading from the standard
# input file.
sub read_item {
        local ($line);
        if ($curritem eq "EOF") {
                # we are already at end of file; do nothing
                return;
        }
        while ($wordsread == @words) {
                $line = <STDIN>;
                if ($line eq "") {
                        $curritem = "EOF";
                        return;
                }
                $line =~ s/\(/ ( /g;
                $line =~ s/\)/ ) /g;
                $line =~ s/^\s+|\s+$//g;
                @words = split(/\s+/, $line);
                $wordsread = 0;
        }
        $curritem = $words[$wordsread++];
}
# Create a tree node.
sub get_new_node {
        local ($value, $leftchild, $rightchild) = @_;
        local ($nodenum);
        $nodenum = $nextnodenum++;
        $tree{$nodenum} = $value;
        $tree{$nodenum . "left"} = $leftchild;
        $tree{$nodenum . "right"} = $rightchild;
        $nodenum;   # return value
}
# Calculate the result.
sub get_result {
         local ($node) = @_;
         local ($nodevalue, $result);
        $nodevalue = $tree{$node};
        if ($nodevalue eq "") {
                die ("Bad tree");
        } elsif ($nodevalue eq "+") {
                $result = &get_result($tree{$node . "left"}) +
                          &get_result($tree{$node . "right"});
        } elsif ($nodevalue eq "-") {
                $result = &get_result($tree{$node . "left"}) -
                          &get_result($tree{$node . "right"});
        } elsif ($nodevalue eq "*") {
                $result = &get_result($tree{$node . "left"}) *
                          &get_result($tree{$node . "right"});
        } elsif ($nodevalue eq "/") {
                $result = &get_result($tree{$node . "left"}) /
                          &get_result($tree{$node . "right"});
        } elsif ($nodevalue =~ /^[0-9]+$/) {
                $result = $nodevalue;
        } else {
                die ("Bad tree");
        }
}
