# the @ratio is about 4/2, 2/4 3/3  of odd to even

my @odd  = 1,3,5 ... 33 ;
my @even = 2,4,6 ... 32 ;
my @ratio;

@ratio.push( $_ ) for ( @even.combinations(4) X @odd.combinations(2) )>>.Set>>.keys;
@ratio.push( $_ ) for ( @even.combinations(3) X @odd.combinations(3) )>>.Set>>.keys;
@ratio.push( $_ ) for ( @even.combinations(2) X @odd.combinations(4) )>>.Set>>.keys;

my $fh = open 'OddEvenRatio.txt', :w;
@ratio.grep( { $fh.print( $_.sort,"\n" ) } ) ;
$fh.close;
