#!/usr/local/bin/perl

$i1 = $i2 = 0;
while($line = <STDIN>) {
	chop($line);
	if($i1 != $i2) { #col2
		$array2[$i2] = $line;	
		$sum_col2 += $line;
		$i2 += 1;
	}
	else { #col1
		$array1[$i1] = $line;	
		$sum_col1 += $line;
		$i1 += 1;
	}
}

$array1_len = @array1;
$array2_len = @array2;
$array_len = ($array1_len >= $array2_len) ? $array1_len : $array2_len;
#print("length: $array1_len\n");
#print("length: $array2_len\n");
#print("length: $array_len\n");

for (my $i=0; $i < $array_len; $i++) {
	&write_line($array1[$i], $array2[$i]);
}
&write_sum($sum_col1, $sum_col2, $sum_col1+$sum_col2);

sub write_line {
	local($value1, $value2) = @_;

	$~ = "LINE_FORMAT";
	write;
}

sub write_sum {
	local($value1, $value2, $value3) = @_;

	$~ = "SUM_FORMAT";
	write;
}

format LINE_FORMAT =
@>>>> @>>>> 
$value1, $value2 
.

format SUM_FORMAT =
@>>>> @>>>> grand: @>>>> 
$value1, $value2, $value3 
.
