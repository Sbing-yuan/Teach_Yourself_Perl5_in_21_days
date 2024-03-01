#!/usr/local/bin/perl

%word_list = (
				0 => 'zero',
				1 => 'one',
				2 => 'two',
				3 => 'three',
				4 => 'four',
				5 => 'five',
				6 => 'six',
				7 => 'seven',
				8 => 'eight',
				9 => 'nine'
			 );

&start_hot_keys;
while (1) {
        $char = getc(STDIN);
        last if ($char eq "\x1B");
		$var = $word_list{$char};
        print ("$var\n");
}
&end_hot_keys;
print ("\n");

sub start_hot_keys {
        system ("stty cbreak");
        system ("stty -echo");
}

sub end_hot_keys {
        system ("stty -cbreak");
        system ("stty echo");
}
