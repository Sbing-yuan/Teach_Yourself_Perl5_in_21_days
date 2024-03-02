 #!/usr/local/bin/perl
 
 $rad90 = &degrees_to_radians(90);
 $sin90 = sin($rad90);
 $cos90 = cos($rad90);
 print ("90 degrees:\nsine is $sin90\ncosine is $cos90\n");
 
 sub degrees_to_radians {
         local ($degrees) = @_;
        local ($radians);

        $radians = atan2(1,1) * $degrees / 45;
}
