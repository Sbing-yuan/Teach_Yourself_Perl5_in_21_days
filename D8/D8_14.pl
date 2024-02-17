#!/usr/local/bin/perl

$total = 0;
$firstcounter = 0;
DONE: while ($firstcounter < 10) {
        $secondcounter = 1;
        while ($secondcounter <= 10) {
                $total++;
                if ($firstcounter == 4 && $secondcounter == 7) {
                        last DONE;
                }
                $secondcounter++;
        }
        $firstcounter++;
}
print ("$total\n");
