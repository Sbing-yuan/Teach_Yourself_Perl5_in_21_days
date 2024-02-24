#What is wrong with the following code?
#%list = ("Fred", 61, "John", 72,
#"Jack", 59, "Mary", 80);
#$surname = "Smith";
#foreach $firstname (keys (%list)) {
#%list{$firstname." ".$surname} = %list{$firstname};
#}
# change % to $

%list = ("Fred", 61, "John", 72,
"Jack", 59, "Mary", 80);
$surname = "Smith";
foreach $firstname (keys (%list)) {
	$list{$firstname." ".$surname} = $list{$firstname};
}
