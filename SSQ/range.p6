my @history = "ssq.TXT".IO.lines;

my %range10;
my %range20;
my %range30;
my %range40;
my %range50;

my %range21;
my %range31;
my %range41;
my %range51;

my %range32;
my %range42;
my %range52;

my %range43;
my %range53;

my %range54;

for @history -> $line {
	$line ~~ m/^^ \S+ \s+ \S+ \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) \s+ 0?(\d+) / ;
	%range10{  $1 - $0 }++ ;
	%range20{  $2 - $0 }++ ;  
        %range30{  $3 - $0 }++ ;  
        %range40{  $4 - $0 }++ ;  
        %range50{  $5 - $0 }++ ;  
        
        %range21{  $2 - $1 }++ ;  
        %range31{  $3 - $1 }++ ;  
        %range41{  $4 - $1 }++ ;  
        %range51{  $5 - $1 }++ ;  
        
        %range32{  $3 - $2 }++ ;  
        %range42{  $4 - $2 }++ ;  
        %range52{  $5 - $2 }++ ;  
        
        %range43{  $4 - $3 }++ ;  
        %range53{  $5 - $3 }++ ;  
        
        %range54{  $5 - $4 }++ ;  
}
#%range10.sort(*.values)>>.say;
#%range20.sort(*.values)>>.say;
#%range30.sort(*.values)>>.say;
#%range40.sort(*.values)>>.say;
#%range50.sort(*.values)>>.say;
#%range21.sort(*.values)>>.say;
#%range31.sort(*.values)>>.say;
#%range41.sort(*.values)>>.say;
#%range51.sort(*.values)>>.say;
#%range32.sort(*.values)>>.say;
#%range42.sort(*.values)>>.say;
#%range52.sort(*.values)>>.say;
#%range43.sort(*.values)>>.say;
#%range53.sort(*.values)>>.say;
%range54.sort(*.values)>>.say;
