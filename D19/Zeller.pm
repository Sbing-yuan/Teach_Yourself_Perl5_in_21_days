package Zeller;

require Exporter;
@EXPORT = (Zeller_out);

sub Zeller_out {
    my ($year, $month, $day) = @_;
    @weekdays = qw('Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday');
    if ($month <= 2) {
        $ym1 = $year - 1;
        $m = $month + 12;
        $y = $ym1%100;
        $c = int($ym1/100);
    }else {
        $m = $month;
        $y = $year%100;
        $c = int($year/100);
    }
    $w_temp = $y + int($y/4) + int($c/4) - (2*$c) + int(26*($m+1)/10) + $day - 1;
    $w = $w_temp % 7;
    return $weekdays[$w];
}

1;
