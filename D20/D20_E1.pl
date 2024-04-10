@files = <*>;

sort(@files);

foreach $file (@files) {
    print($file, "\n");
}
