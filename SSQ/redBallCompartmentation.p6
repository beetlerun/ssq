# This program is for comparmentation: 213,231,312,321,222
my @red1 =  1 .. 11;
my @red2 = 12 .. 22;
my @red3 = 23 .. 33;

my @redBalls;

@redBalls.push( $_ ) for ( @red1.combinations(2) X @red2.combinations(1) X @red3.combinations(3) )>>.Set>>.keys;
@redBalls.push( $_ ) for ( @red1.combinations(2) X @red2.combinations(3) X @red3.combinations(1) )>>.Set>>.keys;
@redBalls.push( $_ ) for ( @red1.combinations(2) X @red2.combinations(2) X @red3.combinations(2) )>>.Set>>.keys;
@redBalls.push( $_ ) for ( @red1.combinations(3) X @red2.combinations(1) X @red3.combinations(2) )>>.Set>>.keys;
@redBalls.push( $_ ) for ( @red1.combinations(3) X @red2.combinations(2) X @red3.combinations(1) )>>.Set>>.keys;

my $fh = open 'T.txt', :w;
@redBalls.grep( { $fh.print( $_.sort,"\n" ) } ) ;
$fh.close;
