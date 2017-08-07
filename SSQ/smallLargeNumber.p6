#This program is about small and larger number compartment
my @smallNumber  =  1 .. 16;
my @largerNumber = 17 .. 33;
my @result;

@result.push( $_ ) for ( @smallNumber.combinations(2) X @largerNumber.combinations(4) )>>.Set>>.keys;
@result.push( $_ ) for ( @smallNumber.combinations(3) X @largerNumber.combinations(3) )>>.Set>>.keys;
@result.push( $_ ) for ( @smallNumber.combinations(4) X @largerNumber.combinations(2) )>>.Set>>.keys;

my $fh = open 'SmallLargeNumber.txt', :w;
@result.grep( {$fh.print( $_.sort,"\n" )} ) ;
$fh.close;
