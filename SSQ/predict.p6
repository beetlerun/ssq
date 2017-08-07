# Chong Lin Gu Ge 4plus

my @history = "ssq.TXT".IO.lines.tail(4);
@history.map( { m/^^ \S+ \s+ \S+ \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) / and $_ = (+$0, +$1, +$2, +$3, +$4, +$5 ).Set } );

my  $neighbor;
for @history[*-1].keys -> $ball {
	$ball == 33 and $neighbor.push( $ball - 1 ) and next;
	$ball == 1  and $neighbor.push( $ball + 1 ) and next;
	$neighbor.push( $ball + 1, $ball - 1 );
}



$neighbor = $neighbor (-) @history[*-1];
my $set = 1 .. 33;
my $orphan = $set (-) $neighbor (-) @history[*-1];

my @optionalSet;
for @history[*-1].keys.combinations(1) -> $c {
	for $neighbor.combinations(3) -> $n {
		for $orphan.combinations(2) -> $o {
			@optionalSet.push( $c (|) $n (|) $o ) if ( ( $c (|) $n (|) $o ) (&) @history[0] ).keys.elems < 3 ;	
		}
	}
}

for @history[*-1].keys.combinations(1) -> $c {
	for $neighbor.combinations(2) -> $n {
		for $orphan.combinations(3) -> $o {
			@optionalSet.push( $c (|) $n (|) $o ) if ( ( $c (|) $n (|) $o ) (&) @history[0] ).keys.elems < 3 ;	
		}
	}
}

for @history[*-1].keys.combinations(2) -> $c {
	for $neighbor.combinations(1) -> $n {
		for $orphan.combinations(3) -> $o {
			@optionalSet.push( $c (|) $n (|) $o ) if ( ( $c (|) $n (|) $o ) (&) @history[0] ).keys.elems < 3 ;	
		}
	}
}

for @history[*-1].keys.combinations(2) -> $c {
	for $neighbor.combinations(2) -> $n {
		for $orphan.combinations(2) -> $o {
			@optionalSet.push( $c (|) $n (|) $o ) if ( ( $c (|) $n (|) $o ) (&) @history[0] ).keys.elems < 3 ;	
		}
	}
}

my $last = @history[0..3]>>.keys.Set;
my @base = "Base.txt".IO.lines;
@base.map( {  m/^^ (\d+) \s+ (\d+) \s+ (\d+) \s+ (\d+) \s+ (\d+) \s+ (\d+) / and  $_ = ( +$0, +$1, +$2, +$3, +$4, +$5).Set } );

my $notIncluded = ( 2, 3, 4, 8, 9, 15, 17, 21, 26, 27, 30, 31, 32, 33).Set;
my $included = ( 7, 10, 22, 23 ).Set;

my $fh = open 'Millionaire.txt', :w;
for keys @optionalSet (&) @base  -> $line { 
	if  5 > ( $line.keys (&) $last.keys ).keys.elems >  2 {
		#next if ( $line.keys (&) $notIncluded.keys ).keys.elems >  0 ;
		next if $notIncluded.any (elem) $line;
		next unless ( $line.keys (&) $included.keys ).keys.elems ==  1 ;

		for $line.keys.sort -> $key {
			$fh.print( $key, "\t") ;
		}
		$fh.print( "\n" ) ;	
	}
}
$fh.close;
