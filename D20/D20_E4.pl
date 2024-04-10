#BUG BUSTER: What is wrong with the following statements?
# <$fileepattern> -> treated as file variables, change to <${filepattern}>
print ("Perl files in this directory:\n");
$filepattern = "*.pl";
while ($name = <${filepattern}>) {
print ("$name\n");
}
