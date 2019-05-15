#creates a list of target terms for each start term in the start term file using ABC co-occurrence information
# start term file is of the format: cui\n
# matrix file is of the format cui\tcui\tcount\n
# output file is of the format startCui,targetCui1,targetCui2,...targetCuin,\n
use strict;
use warnings;

my $startTermFile = 'raynaudStartCuis';
my $matrixFile = '../../../rawData/1975_2015_window8_threshold1';
my $outputFile = 'cTerms_raynaud_full';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);



=comment
#user input
###### Co-occurrence Based
my $startTermFile = '../../../startCuis/randomCuis_T047';
my $matrixFile = '../../../rawData/1975_1999_window8_ordered_threshold1';
my $outputFile = '../../../preprocessedData/cTerms_T047_coocABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);

$startTermFile = '../../../startCuis/randomCuis_T121';
$outputFile = '../../../preprocessedData/cTerms_T121_coocABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);

$startTermFile = '../../../startCuis/randomCuis_T184';
$outputFile = '../../../preprocessedData/cTerms_T184_coocABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);

$startTermFile = '../../../startCuis/randomCuis_T200';
$outputFile = '../../../preprocessedData/cTerms_T200_coocABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);




###### Predication Based
$startTermFile = '../../../startCuis/randomCuis_T047';
$matrixFile = '../../../rawData/predicatePairs_1975_1999';
$outputFile = '../../../preprocessedData/cTerms_T047_predicateABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);

$startTermFile = '../../../startCuis/randomCuis_T121';
$outputFile = '../../../preprocessedData/cTerms_T121_predicateABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);

$startTermFile = '../../../startCuis/randomCuis_T184';
$outputFile = '../../../preprocessedData/cTerms_T184_predicateABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);

$startTermFile = '../../../startCuis/randomCuis_T200';
$outputFile = '../../../preprocessedData/cTerms_T200_predicateABC';
&ABCGeneration($startTermFile, $matrixFile, $outputFile);
=cut


#generates target terms for each start term using the ABC co-occurrence model
sub ABCGeneration {
    my $startTermFile = shift;
    my $matrixFile = shift;
    my $outputFile = shift;

    #Read the start terms into an array
    open IN, $startTermFile or die ("ERROR: unable to open startTermFile: $startTermFile\n");
    my @startTerms = ();
    while (my $line = <IN>) {
	chomp $line;
	push @startTerms, $line;
    }
    close IN;


    #read the matrix file into memory of the format $hash{$cui1} = \@cooccurringCuis
    open IN, $matrixFile or die ("ERROR: unable to open $matrixFile\n");
    my %matrix = ();
    while (my $line = <IN>) {
	#line is cui\tcui\tcount
	my @vals = split(/\t/,$line);
	my $cui1 = $vals[0];
	my $cui2 = $vals[1];
	if (!defined $cui1 || !defined $cui2) {
	    die ("ERROR: cui1 or cui2 is not defined, line = $line");
	}

	#create the list of co-occurring terms if needed and add cui2
	if (!defined $matrix{$cui1}) {
	    my @newArray = ();
	    $matrix{$cui1} = \@newArray;
	}
	push @{$matrix{$cui1}},$cui2;
    }
    close IN;

    #find target terms for each start term using the ABC model
    # output the results as they are generated
    open OUT, ">$outputFile" or die("ERROR: unable to open output file: $outputFile\n");
    foreach my $aTerm (@startTerms) {
	#get the list of co-occurring terms (B)
	my @bTerms = ();
	if (defined $matrix{$aTerm}) {
	    @bTerms = @{$matrix{$aTerm}};
	}

	#get the list of target terms (C)
	# use a hash to avoid duplicates
	my %cTerms = ();
	foreach my $bTerm (@bTerms) {
	    #get terms that co-occur with B
	    my @bcTerms = ();
	    if (defined $matrix{$bTerm}) {
		@bcTerms = @{$matrix{$bTerm}};
	    }

	    #add the bc co-occurrences to the list of c terms
	    foreach my $bcTerm (@bcTerms) {
		$cTerms{$bcTerm}=1;
	    }
	}

	#output the cTerms for this aTerm
	print OUT "$aTerm";
	foreach my $cTerm (keys %cTerms) {
	    print OUT ",$cTerm";
	}
	print OUT "\n";
    }
    close OUT;

    print "Done!\n";
}

