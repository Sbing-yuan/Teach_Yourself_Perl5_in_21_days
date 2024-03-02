#!/usr/local/bin/perl

print("Degree input: ");
$input = <STDIN>;
chop($input);
$rad = &degrees_to_radians($input);
$sin = sin($rad);
$cos = cos($rad);
$tan = $sin / $cos;
print ("sine is $sin\n");
print ("cosine is $cos\n");
print ("tangent is $tan\n");

sub degrees_to_radians {
        local ($degrees) = @_;
        local ($radians);

        $radians = atan2(1,1) * $degrees / 45;
}
