package pack1;
$var = <STDIN>;
chop($var);

package pack2;
$var = <STDIN>;
chop($var);

package main;
$total = $pack1::var + $pack2::var;
print("total is : $total\n");
