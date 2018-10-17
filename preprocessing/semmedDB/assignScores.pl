#finds the start cui pairs in semmed files, and assigns scores from the 
# association vector file
# ... so any pairs and their scores in the semmed file are output
# does not consider order of the relation
use strict;
use warnings;

#User Input
my $goldVectorsFile = '../../../preprocessedData/vectors_x2_1975_2015_window8_threshold1_randomCuis_all';
my $semmedFile = '../../../rawData/SemMedDB_Matrix_allPredications';
my $outFile = '../../../preprocessedData/SemMedDB_Vectors_allPredications_withGoldScores_randomCuis_all';
&assignScores($goldVectorsFile, $semmedFile);



########################################################
#                   BEGIN CODE
########################################################
sub assignScores {
    my $goldVectorsFile = shift;
    my $semmedFile = shift;
    my $outfile = shift;

    #read in the data
    my $goldVectorsRef = &readVectorFile($goldVectorsFile);
    my $relationsRef = &readMatrixFile($semmedFile, $goldVectorsRef);

#Output as a matrix
=comment
    #output the sememedDB relations with vector scores
    open OUT, ">$outFile" or die ("ERROR: unable to open outfile: $outFile\n");
    foreach my $cui1 (keys %{$relationsRef}) {
	foreach my $cui2 (keys %{${$relationsRef}{$cui1}}) {
	    my $score = ${${$goldVectorsRef}{$cui1}}{$cui2};
	    if (defined $score) {
		print OUT "$cui1\t$cui2\t$score\n";
	    }
	}
    }
    close OUT;
=cut

    #output the sememedDB relations with vector scores
    open OUT, ">$outFile" or die ("ERROR: unable to open outfile: $outFile\n");
    foreach my $cui1 (keys %{$relationsRef}) {
	print OUT "$cui1";
	foreach my $cui2 (keys %{${$relationsRef}{$cui1}}) {
	    my $score = ${${$goldVectorsRef}{$cui1}}{$cui2};
	    if (defined $score) {
		print OUT "<>$cui2,$score";
	    }
	}
	print OUT "\n";
    }
    close OUT;

    print "Done!\n";
}




#Reads the known relations into memory
# Only reads in relations for which a vector exists
sub readMatrixFile {
    my $matrixFile = shift;
    my $vectorsRef = shift;

    #read the known relations into memory ${$hash{$cui1}}{$cui2} = 1
    open IN, $matrixFile or die ("ERROR: unable to open $matrixFile\n");
    my %knownRelations = ();
    while (my $line = <IN>) {
        #line is cui\tcui\tcount
	my @vals = split(/\t/,$line);
        my $cui1 = $vals[0];
        my $cui2 = $vals[1];
        if (!defined $cui1 || !defined $cui2) {
            die ("ERROR: cui1 or cui2 is not defined, line = $line");
	}

        #only grab relations for the start cuis
	if (defined ${$vectorsRef}{$cui1}) {
            #create the list of co-occurring terms if needed and add cui2
	    if (!defined $knownRelations{$cui1}) {
		my %newHash = ();
                $knownRelations{$cui1} = \%newHash;
            }
            ${$knownRelations{$cui1}}{$cui2} = 1;
	}

	
	#Check Cui2, to expand the search
        #only grab relations for the start cuis
	if (defined ${$vectorsRef}{$cui2}) {
            #create the list of co-occurring terms if needed and add cui2
	    if (!defined $knownRelations{$cui2}) {
		my %newHash = ();
                $knownRelations{$cui2} = \%newHash;
            }
            ${$knownRelations{$cui2}}{$cui1} = 1;
	}
    }
    close IN;
    
    return \%knownRelations;
}


sub readVectorFile {
    my $fileName = shift;

    #read the score vector into a hash 
    open IN, $fileName
        or die ("ERROR: cannot open score vector file: $fileName\n");
    my %scores = ();
    while (my $line = <IN>) {
        chomp $line;
        my @lineVals = split(/<>/,$line);
        #line is format: cui1<>cui2,score<>cui2,score<>...<>cui2,score<> 
       
        #Skip empty lines
	if ($line eq '') {
            next;
        }

        #cui1 is the first value listed
	my $cui1 = shift @lineVals;
	if (!defined $cui1) {
            print "CUI1 undefined, line = $line\n";
            next;
        }

        #all other values are cui2,score pairs
	my $sum = 0;
        my %scoreVector = ();
        foreach my $pair(@lineVals) {
            my @pairVals = split(/,/,$pair);
            #pair is $cui2,$score
            #$pairVals[0] = $cui2
            #$pairVals[1] = $cui1
	    if (!defined $pairVals[0] || !defined $pairVals[1]) {
                print STDERR "ERROR: pairVals undefined at $line\n";
                next;
            }
            #only values > 0 are kept
	    if ($pairVals[1] > 0) {
                $scoreVector{$pairVals[0]} = $pairVals[1];
                $sum += $pairVals[1];
            }
        }

        #ensure sum is positive
        if ($sum < 0) {
            print "WARNING: sum of $cui1 of $fileName is < 0: $sum\n";
        }

	#save the score vector
	$scores{$cui1} = \%scoreVector;

    }
    close IN;

    #return the hash of score vectors
    return \%scores;
}
