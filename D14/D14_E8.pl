#!/usr/local/bin/perl

while($line = <STDIN>) {
	@words = split(/\s+/, $line);
	push @text, @words;
}

print(join(' ', @text));
print("\n");

@short_words = grep(/\b\w{1,5}\b/, @text);
print(join(' ', @short_words));
print("\n");
