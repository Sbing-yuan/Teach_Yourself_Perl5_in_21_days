#!/usr/local/bin/perl

for ($i=0; $i<10; $i++) {
	push(@words, int(rand(100)));
}

print("Before Sorting:");
print(join(', ', @words), "\n");

#1 j = 0
#2 i = j
#3 if words[i] > words[i+1] swap
#4 if i reach arraylentgh goto step5 else i = i + 1 goto step3
#5 i = j+1 goto step3

for ($j=0; $j<10; $j++) {
	for($i=0; $i<9; $i++) {
		if($words[$i] > $words[$i+1]) {
			$temp = splice(@words, $i, 1);	
			splice(@words, $i+1, 0, $temp);
		}
	}
}

print("After Sorting:");
print(join(', ', @words), "\n");
