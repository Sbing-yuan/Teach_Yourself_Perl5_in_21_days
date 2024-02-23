#!/usr/local/bin/perl

@pitcherfields = ("NAME", "KEY", "GP", "W", "ERA");
@playerfields = ("NAME", "KEY", "GP", "HR", "RBI", "BA");

# Build the player database by reading from standard input.
# %playerbase contains the database, @playerlist the list of
# players (for later sequential access).
$playercount = 0;
while ($input = <STDIN>) {
        $input =~ s/^\s+|\s+$//g;
        @words = split (/\s+/, $input);
        $playerlist[$playercount++] = $words[0];
        if ($words[1] eq "player") {
                @fields = @playerfields;
        } else {
                @fields = @pitcherfields;
        }
        for ($count = 1; $count <= @words; $count++) {
                $playerbase{$words[0].$fields[$count-1]} =
                        $words[$count-1];
        }
}

# now, print out pitcher win totals and player home run totals
foreach $player (@playerlist) {
        print ("$player: ");
        if ($playerbase{$player."KEY"} eq "player") {
                $value = $playerbase{$player."HR"};
                print ("$value home runs\n");
        } else {
                $value = $playerbase{$player."W"};
                print ("$value wins\n");
        }
}
