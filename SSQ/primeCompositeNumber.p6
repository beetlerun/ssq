#This is about composite and prime number ratio.

my @primeNumber     = 1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31;
my @compositeNumber = 4, 6, 8, 9, 10 ,12, 14, 15, 16, 18, 20, 21, 22, 24, 25, 26, 27, 28, 30, 32, 33;


my @primeComposite;
@primeComposite.push( $_ ) for ( @primeNumber.combinations(1) X @compositeNumber.combinations(5) )>>.Set>>.keys;
@primeComposite.push( $_ ) for ( @primeNumber.combinations(2) X @compositeNumber.combinations(4) )>>.Set>>.keys;
@primeComposite.push( $_ ) for ( @primeNumber.combinations(3) X @compositeNumber.combinations(3) )>>.Set>>.keys;


my $fh = open 'PrimeCompositeNumber.txt', :w;
@primeComposite.grep( { $fh.print( $_.sort,"\n" ) } ) ;
$fh.close;
