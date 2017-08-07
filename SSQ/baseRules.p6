my @oddEven = "OddEvenRatio.txt".IO.lines;
my @redBall = "RedBallCompartmentation.txt".IO.lines;
my @smallLarge = "SmallLargeNumber.txt".IO.lines;
my @primeComposite = "PrimeCompositeNumber.txt".IO.lines;

my Set $base =  @oddEven (&) @redBall (&) @smallLarge (&) @primeComposite ;

my $fh = open 'Base.txt', :w;
for $base.keys.sort -> $line {
	$line ~~ m/^^ (\d+) \s+ (\d+) \s+ (\d+) \s+ (\d+) \s+ (\d+) \s+ (\d+)  /;
	next if ( $0 == $1 - 1 == $2 - 2 or  $1 == $2 - 1 == $3 - 2 or $2 == $3 - 1 == $4 - 2 or $3 == $4 - 1 == $5 - 2 );
	my $neighbor = ( $1 - $0, $2 - $1, $3 - $2, $4 -$3, $5 - $4 );
	next if $neighbor.none > 5;
	next if $1 + $0 < 22 and $1 - $0 > 8;
	next if $4 + $5 > 46 and $5 - $4 > 7;
	next if $4 < 23 and $5 - $4 < 5;

	next unless $1 - $0 < 10;
	next unless $2 - $0 < 16;
	next unless 7 < $3 - $0 < 22;
	next unless 13 < $4 - $0 < 27;
	next unless 15 < $5 - $0 < 32;
	next unless $2 - $1 < 9;
	next unless 2 < $3 - $1 < 17;
	next unless 7 < $4 - $1 < 22;
	next unless 13 < $5 - $1 < 28;
	next unless $3 - $2 < 17;
	next unless 1 < $4 - $2 < 17;
	next unless 7 < $5 - $2 < 21;
	next unless $4 - $3 < 10;
	next unless 2 < $5 - $3 < 15;
	next unless $5 - $4 < 9;

	my $range = $5 - $0 ;
	my $sum =  $0 + $1 + $2 + $3 + $4 + $5;
	next if ( 29 < $range or $range < 20 );

	next unless $sum % 2 == 0;
	next if $sum.is-prime ;
	$fh.print( "$line\n" )  if  80 < $sum < 110 ;

}
$fh.close;

