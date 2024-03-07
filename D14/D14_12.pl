#!/usr/local/bin/perl

$count = 0;
while ($line = <STDIN>) {
        chop ($line);
        @words = split(/\s+/, $line);
        $added = 0;
        for ($i = 0; $i+$added < @words; $i++) {
                if ($count > 0 && ($count + $i) % 10 == 0) {
                        splice (@words, $i+$added, 0,
                                $count + $i);
                        $added += 1;
                }
        }
        $count += @words - $added;
        $line = join (" ", @words);
        print ("$line\n");
}
