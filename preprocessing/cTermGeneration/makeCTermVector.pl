#makes a vector file using the cTerm File and a vector file of all possible scores
# so it creates the scores between all cTerms in the cTerm file, where the 
# vector file defines all possible scores
# Input:
#    cTermsFile - comma seperated list of cTerms: rowcui,cui1,cui2,...,
#    allScoresFile - vector file of all scores: rowCui<>cui1,score<>cui2,score<>...
# Output:
#    cTermVectorFile - vector file of scores for the cTerms: rowCui<>cui1,score<>cui2,score<>...
#
use strict;
use warnings;


#### SBC
my $measure = 'sbc';
## T047
my $type = 'T047';
my $cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
my $allScoresFile = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_'.$measure;
my $outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

## T121
$type = 'T121';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_'.$measure;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

## T184
$type = 'T184';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_'.$measure;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

## T200
$type = 'T200';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_'.$measure;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

#### LTC
$measure = 'ltc';
## T047
$type = 'T047';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_lta';
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

## T121
$type = 'T121';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_lta';
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T184
$type = 'T184';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_lta';
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

## T200
$type = 'T200';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$type.'_lta';
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);



#### word2vec
$measure = 'word2vec';
## T047
$type = 'T047';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T121
$type = 'T121';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_T047_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T184
$type = 'T184';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T200
$type = 'T200';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


#### direct (explicit) cosine
$measure = 'explicitCosine';
## T047
$type = 'T047';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T121
$type = 'T121';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_T047_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T184
$type = 'T184';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


## T200
$type = 'T200';
$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_coocABC';
$allScoresFile = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$type;
$outputFile = $allScoresFile.'_coocABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);

$cTermsFile = '../../../preprocessedData/cTerms_'.$type.'_predicateABC';
$outputFile = $allScoresFile.'_predicateABC';
&makeVectorFile($cTermsFile, $allScoresFile, $outputFile);


###################################
#      BEGIN CODE
###################################
#method to make the vector file for cTerms from scores in the scores file
sub makeVectorFile {    
    my $cTermsFile = shift;
    my $allScoresFile = shift;
    my $outputFile = shift;

    #read in the cTerms file into a hash of arrays
    my $cTermsHashRef = &readTermsFile($cTermsFile);

    #read in the vector file as a hash of hashes
    my $vectorHashRef = &readVectorFile($allScoresFile);

    #output scores for each term
    open OUT, ">$outputFile" or die ("ERROR: unable to open outputFile: $outputFile\n");
    foreach my $rowTerm (keys %{$cTermsHashRef}) {
	#grab the data structures
	my $termsRef = ${$cTermsHashRef}{$rowTerm};
	my $termValuesRef = ${$vectorHashRef}{$rowTerm};

	#output the vector
	print OUT $rowTerm;
	if (defined $termsRef && defined $termValuesRef) {   
	    foreach my $term (@{$termsRef}) {
		my $score = ${$termValuesRef}{$term};

		#skip any undefined scores (sparse matrix format)
	        if (!defined $score) {
		    next;
		}    
	        
		#output the term and its score
		print OUT "<>$term,$score";
	    }
	}
	print OUT "\n";
    }
    close OUT;

    print "Done!\n";
}


#Reads in a file of terms of the format
# rowTerm,term1,term2,...
# into a hash of arrays such that hash{rowCui} = \@terms
sub readTermsFile {
    open IN, $cTermsFile or die ("ERROR: unable to open cTermsFile: $cTermsFile\n");
    my %terms = ();
    while (my $line = <IN>) {
	chomp $line;

        #row is $rowTerm,term1,term2...
	my @vals = split(/,/,$line);

	#ensure the last element isn't just a new line or empty
	if (@vals[(scalar @vals)-1] eq "\n" || @vals[(scalar @vals)-1] eq "") {
	    pop @vals;
	}

	#grab the row term and initialize
	my $rowTerm = shift @vals;
	my @terms = ();
	$terms{$rowTerm} = \@terms;
	
        #add each term to the list of terms
	foreach my $term(@vals) {
	    push @terms, $term;
	}
    }
    close IN;

    #return the start and target terms hash
    return \%terms;
}



#Reads a vector file in as a hash of hashes
# ${$hash{$rowCui}}{$colCui}=score
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

        #all other values are cui2,score pairs
	my $sum = 0;
	my %scoreVector = ();
	foreach my $pair(@lineVals) {
            my @pairVals = split(/,/,$pair);
            #pair is $cui2,$score
            #$pairVals[0] = $cui2
            #$pairVals[1] = $cui1
	    
            #ensure values are defined
	    if (!defined $pairVals[0] || !defined $pairVals[1]) {
		print STDERR "ERROR: pairVals undefined at $line\n";
		next;
            }
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



