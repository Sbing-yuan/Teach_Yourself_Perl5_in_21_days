#!/usr/local/bin/perl

print ("Enter the password for this program:\n");
system ("stty -echo");
$mypasswd = <STDIN>;
system ("stty echo");
chop ($mypasswd);

$mypasswd_crypted = crypt ($mypasswd, '00');

while($try < 3) {
	print ("Enter the password:\n");
	system ("stty -echo");
	$mypasswd = <STDIN>;
	system ("stty echo");

	if (crypt ($mypasswd, '00') eq $mypasswd_crypted) {
	        print ("Correct! Carry on!\n");
			$pass_flg = 1;
			last;
	} else{
	        print ("Incorrect password\n");
	}
	$try++;
}

if($pass_flg == 0) {
	print("Exceed limit for password entering\n");
}

