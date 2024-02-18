#!/usr/local/bin/perl

$num_t;

$in_string = "this is a book";
$num_t = &count_t($in_string);
print("$num_t\n");

$in_string = "tt is a car";
$num_t = &count_t($in_string);
print("$num_t\n");

$in_string = "i want a table";
$num_t = &count_t($in_string);
print("$num_t\n");

$in_string = "terrible tablet";
$num_t = &count_t($in_string);
print("$num_t\n");


sub count_t {
	my ($in_string) = @_;
	my @array;
	$in_string = $in_string .' ';
	@array = split(/t/, $in_string);
	$retval = @array-1;
}
