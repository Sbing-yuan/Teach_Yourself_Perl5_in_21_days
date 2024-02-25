#!/usr/local/bin/perl

for ($i=1;$i<=10;$i+=3) {
	$value1 = $i;
	$value2 = $i+1;
	$value3 = $i+2;
	if ($value1 > 10) {
		$value1 = ""
	}
	else {
		$value1 = 2**$value1	
	}

	if ($value2 > 10) {
		$value2 = ""
	}
	else {
		$value2 = 2**$value2	
	}

	if ($value3 > 10) {
		$value3 = ""
	}
	else {
		$value3 = 2**$value3	
	}

	$~ = "MYFORMAT";
	write
}

format MYFORMAT =
	@>>>>> @>>>>> @>>>>>
	$value1, $value2, $value3
.
