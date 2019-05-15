#TODO - edit description
# createGRaphOutput.pl
#
# Evaluation for indirect ranking measures. Compares the direct scores to 
# indirect scores on a pre-cutoff dataset (partial dataset) and the 'future'
# direct scores to indirect scores.
# We evaluate the indirect scores both at their ability to estimate current 
# direct scores, and their ability to estimate future direct scores. Score 
# files are generated using a gold standard method (e.g. x2) on a current 
# dataset (e.g. 1975-2000), and a future dataset (e.g. 1975-2015). Indirect 
# scores are also generated from the current dataset. This results in vector 
# files for N different cuis for current direct score vectors, future direct 
# score vectors, and indirect score vectors.
# 
# The evaluation then computes cumulative score at k, that is, it sums the 
# direct scores of each CUI using the indirect score rankings. This is done 
# for the current CUIs only, and the future CUIs only. In this manner we 
# generate two output files: One for cumulative current scores, how good the 
# indirect method is at estimating current scores, and one for the cumulative 
# future direct scores (using terms that ONLY occur in the future direct set) 
# to estimate how good the indirect measures are at estimting future direct 
# scores. 
#
# Input: 
#  Takes as input three score vector files:
#     $currentDirectScoresFile - vector file containing direct scores 
#          generated from current data (e.g. x2 using 1975-2000)
#     $futureDirectScoresFile - vector file containing direct scores generated 
#          from future data (e.g. x2 using 1975-2015)
#     $indirectScoresFile - vector file containing indirect scores generated 
#          from current data (e.g. LTA using 1975-2000)
# 
# Input format is a sparse vector format such that each line contains the 
# score vector for a CUI. The line contains: 
#      rowCui<>cui_1,score<>cui_2,score<>...<>cui_n,score<>
#
# Output:
#  Outputs three files, two contain the cumulative sums of the direct scores
#  using the rankings of the indirect scores. These files are:
#      $currentOutFile - cumulative sum at i of current direct rankings
#      $futureOutFile - cumulative sum at i of future direct rankings 
#  the other file contains the average precision for each test CUI as
#  well as the mean average precision over all of them
#  output format is label column tab average precision (e.g. MAP \t 0.1)
#
#  Output format is as follows:
#  column contains the cumulative sums of a single CUI, each row indicates i. 
#  The first column is the average, and the first row are labels containing 
#  either 'average' or the CUI that column contains cumulative sums for. Values
#  are tab seperated.
#
use strict;
use warnings;

#File containing semmedDB data
my $semmedFile = '../../preprocessedData/SemMedDB_Vectors_allPredications_withGoldScores_randomCuis_all';
my $outputDir = '../../results/';
my $vectorDir = '../../preprocessedData/';

#NOTE: this is method A

###################################################
# user Input
###################################################
#### MEDLINE Co-occurrence as gold #################
# ideal
# the known relations file is the pre-cutoff matrix file
my $matrixFile = '../../rawData/1975_1999_window8_ordered_threshold1';
# file containing the gold standard score vectors
my $goldScoresFile = '../../preprocessedData/vectors_x2_1975_2015_window8_threshold1_randomCuis_all';

# file containing predicted score vectors
my $predictedScoresFile = $goldScoresFile;

# file to output the cumulative relatedness graph
my $crgOutFile = $outputDir.'crg_ideal';
#generate the graph out
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-LTC
$predictedScoresFile = $vectorDir.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta_coocABC';
$crgOutFile = $outputDir.'/crg_coocABC_ltc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# predABC-LTC
$predictedScoresFile = $vectorDir.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta_predicateABC';
$crgOutFile = $outputDir.'crg_predicateABC_ltc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-SBC
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc_coocABC';
$crgOutFile = $outputDir.'crg_coocABC_sbc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-SBC
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc_predicateABC';
$crgOutFile = $outputDir.'crg_predicateABC_sbc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-word2vec
$predictedScoresFile = $vectorDir.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all_coocABC';
$crgOutFile = $outputDir.'crg_coocABC_word2vecCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-word2vec
$predictedScoresFile = $vectorDir.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all_predicateABC';
$crgOutFile = $outputDir.'crg_predicateABC_word2vecCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-explicitCosine
$predictedScoresFile = $vectorDir.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all_coocABC';
$crgOutFile = $outputDir.'crg_coocABC_explicitCosine';
#&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-explicitCosine
$predictedScoresFile = $vectorDir.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all_predicateABC';
$crgOutFile = $outputDir.'crg_predicateABC_explicitCosine';
#&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";





#### SemMedDB as gold ###########################
# ideal
$matrixFile = '../../rawData/1975_1999_window8_ordered_threshold1';
$goldScoresFile = $semmedFile;
$predictedScoresFile = $semmedFile;
$crgOutFile = $outputDir.'crg_semmed_ideal';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-LTC
$predictedScoresFile = $vectorDir.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta_coocABC';
$crgOutFile = $outputDir.'crg_semmed_coocABC_ltc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-LTC
$predictedScoresFile = $vectorDir.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta_predicateABC';
$crgOutFile = $outputDir.'crg_semmed_predicateABC_ltc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-SBC
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc_coocABC';
$crgOutFile = $outputDir.'crg_semmed_coocABC_sbc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-SBC
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc_predicateABC';
$crgOutFile = $outputDir.'crg_semmed_predicateABC_sbc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-word2vec
$predictedScoresFile = $vectorDir.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all_coocABC';
$crgOutFile = $outputDir.'crg_semmed_coocABC_word2vecCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-word2vec
$predictedScoresFile = $vectorDir.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all_predicateABC';
$crgOutFile = $outputDir.'crg_semmed_predicateABC_word2vecCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

# coocABC-explicitCosine
$predictedScoresFile = $vectorDir.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all_coocABC';
$crgOutFile = $outputDir.'crg_semmed_coocABC_explicitCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";
# predABC-explicitCosine
$predictedScoresFile = $vectorDir.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all_predicateABC';
$crgOutFile = $outputDir.'crg_semmed_predicateABC_explicitCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";




#### MEDLINE Co-occurrence as gold, all terms (not ABC linking) #################
# the known relations file is the pre-cutoff matrix file
$matrixFile = '../../rawData/1975_1999_window8_ordered_threshold1';
$goldScoresFile = '../../preprocessedData/vectors_x2_1975_2015_window8_threshold1_randomCuis_all';

#Explicit Cosine
$predictedScoresFile = $vectorDir.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$crgOutFile = $outputDir.'crg_allTerms_explicitCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#LTC
$predictedScoresFile = $vectorDir.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$crgOutFile = $outputDir.'crg_allTerms_ltc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#random
$predictedScoresFile = $vectorDir.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$crgOutFile = $outputDir.'crg_allTerms_random';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#word2vecCosine
$predictedScoresFile = $vectorDir.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$crgOutFile = $outputDir.'crg_allTerms_word2vecCosine';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#Direct X2
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$crgOutFile = $outputDir.'crg_allTerms_directX2';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#LSA
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lsa';
$crgOutFile = $outputDir.'crg_allTerms_lsa';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#LTA
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$crgOutFile = $outputDir.'crg_allTerms_lta';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#MWA
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$crgOutFile = $outputDir.'crg_allTerms_mwa';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";

#SBC
$predictedScoresFile = $vectorDir.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$crgOutFile = $outputDir.'crg_allTerms_sbc';
&evaluateIndirectRanking($predictedScoresFile, $goldScoresFile, $matrixFile, $crgOutFile);
print "DONE!\n";


###################################################
# Begin Code
###################################################
# Creates the graph output and writes it to file. The graph
# output is a sum of correlations (summed associations at k)
# for both explicit and implicit associaitons.
#
# Input: TODO
# Output: none
sub evaluateIndirectRanking {
    #grab input
    my $scoresFile = shift;
    my $goldFile = shift;
    my $coocMatrixFile = shift;
    my $crgOutFile = shift;

    #read input
    my $goldVectorsRef = &readVectorFile($goldFile);
    my $scoreVectorsRef = &readVectorFile($scoresFile);
    my ($knownRelationsRef, $vocabRef) = &readMatrixFile($coocMatrixFile, $scoreVectorsRef);

    #remove words not in the past vocabulary from the gold standard
    foreach my $rowCui (keys %{$goldVectorsRef}) {
	foreach my $colCui (keys %{${$goldVectorsRef}{$rowCui}}) {
	    if (!defined ${$vocabRef}{$colCui}) {
		delete ${${$goldVectorsRef}{$rowCui}}{$colCui}
	    }
	}
    }
    #the scores vector contains past only vocab because it was generated in the past

    #remove relations known from the gold standard and predicted scores
    # to make them just future relations and their scores
    foreach my $rowCui (keys %{$goldVectorsRef}) {
	foreach my $colCui (keys %{${$goldVectorsRef}{$rowCui}}) {
	    if (defined ${${$knownRelationsRef}{$rowCui}}{$colCui}) {
		delete ${${$goldVectorsRef}{$rowCui}}{$colCui}
	    }
	}
    }
    foreach my $rowCui (keys %{$scoreVectorsRef}) {
	foreach my $colCui (keys %{${$scoreVectorsRef}{$rowCui}}) {
	    if (defined ${${$knownRelationsRef}{$rowCui}}{$colCui}) {
		delete ${${$scoreVectorsRef}{$rowCui}}{$colCui}
	    }
	}
    }
    
    #calculate the cumulative relatedness graph
    my $crgRef = &calculateCRG($scoreVectorsRef, $goldVectorsRef);
   
    #calculate the total sums for future so that we can output percents
    #find for implicit future scores
    my %totalRelatedness = ();
    foreach my $cui (keys %{$goldVectorsRef}) {
	my %goldVector = %{${$goldVectorsRef}{$cui}};
	my $sum = 0;
	foreach my $cui2 (keys %goldVector) {
	    $sum += $goldVector{$cui2};
	}
	$totalRelatedness{$cui} = $sum;
    }

    #output the results
    &outputResults($crgRef, $crgOutFile, \%totalRelatedness);
}


# Calculates the cumulative sums of direct future scores using the rankings 
# of predicted (indirect) scores. Only Cuis that occur in the future, but not 
# current are used in the calculation. 
# Input:  $scoresVectorsRef - hash ref of predicted (indirect) score
#               vectors ($hash{$cui1}=\%vector, $vector{$cui2}=$score, 
#               $score is the score between $cui1 and $cui2)
#         $goldVectorsRef - hash ref of direct score vectors 
#              ($hash{$cui1}=\%vector, $vector{$cui2}=$score, $score is the
#               score between $cui1 and $cui2)
# Output: \%cumulativeSums - hash ref containing the cumulative sum for each 
#              cui ($cumulativeSums{$cui}=\@cumulativeSum, 
#              $cumulativeSum[$i] = the sum of direct future scores at that 
#              rank)
sub calculateCRG {
    #grab the input
    my $scoreVectorsRef = shift;
    my $goldVectorsRef = shift;

    #calculate the cumulative sums of direct rankings for implicit scores
    my %cumulativeSums = ();
    #iterate over each vector to calculate an average
    foreach my $vectorCui (sort keys %{$scoreVectorsRef}) {
	my @cumulativeSum = ();

	#TODO - we shouldn't have to check this, but its needed if gold contains undefined CUIs
	if (defined ${$goldVectorsRef}{$vectorCui}) {

	    #grab the vector of scores
	    my %goldVector = %{${$goldVectorsRef}{$vectorCui}};
	    my %scoresVector = %{${$scoreVectorsRef}{$vectorCui}};

	    #find the cumulative sum at each rank for this vector
	    my $rank = 0;
	    my $sum = 0;
	    foreach my $cui (sort {$scoresVector{$b} <=> $scoresVector{$a}} keys %scoresVector) {
		#only add if the gold score is defined, otherwise it has a score of 0
		if (defined $goldVector{$cui}) {
		    $sum += $goldVector{$cui};
		    $cumulativeSum[$rank] = $sum;
		}
		#else add 0 which means do nothing

		#increment rank for every predicted discovery, even if it is not
		# in the gold standard, this therefore penalizes when false 
		# predictions are made
		$rank++;
	    } 
	}
	
	#save the sum indexed by the vector cui
        $cumulativeSums{$vectorCui} = \@cumulativeSum;
    }

    #return the average cumulative sum
    return \%cumulativeSums;
}



# Outputs the average and individual cumulative sums to file such that each 
# column contains the cumulative sums of a single CUI, each row indicates i. 
# The first column is the average, and the first row are labels containing 
# either 'average' or the CUI that column contains cumulative sums for. Values
#  are tab seperated.
# Input: $cumulativeSumsRef - hash ref to the cumulative sums of each CUI 
#             ($cumulativeSums{$cui} = \@cumulativeSum, 
#             $cumulativeSum[$i]=$cumulativeSumAti)
#        $outFile - the file to write output to
#        $totalsRef - hash ref of total possible sums for each CUI 
#             ($totals{$cui}=$totalDirectScore), total is summed over all 
#             possible CUIs
# Output: none
sub outputResults {
    #grab the input
    my $cumulativeSumsRef = shift;
    my $outFile = shift;
    my $totalsRef = shift;


##### Average where we keep adding 100%, so average is monotonically increasing
    #find the average percent of the total
    my @average = ();
 
    #find the max number to sum
    my $maxNumToSum = 1;
    foreach my $cui (keys %{$cumulativeSumsRef}) {
	my $numToSum = scalar @{${$cumulativeSumsRef}{$cui}};
	if ($numToSum > $maxNumToSum) {
	    $maxNumToSum = $numToSum;
	}
    }

    #sum all cumulative sums for each cui, if there are less than max
    # then we keep adding 100%'s to it, since all of that is accounted
    # for at that $i
    my $numToAverage = 0;
    foreach my $cui (keys %{$cumulativeSumsRef}) {
	my @cumulativeSum = @{${$cumulativeSumsRef}{$cui}};
	my $total = ${$totalsRef}{$cui};
	if (!defined $total) {
	    next;
	    #an undefined total means that there are no new relations in the gold standard
	    # so we can skip this entirely
	}

	if ($total > 0) {
	    $numToAverage++;
	}

	my $totalPredicted = 0;
	for (my $i = 0; $i < $maxNumToSum; $i++) {
	    #add the percent to the average
	    if (defined $cumulativeSum[$i]) {
		if ($total == 0) {
		    $average[$i] = 0;
		} else {
		    $average[$i] += ($cumulativeSum[$i]/$total);
		}
		$totalPredicted = $cumulativeSum[$i]; #set the total highest sum found
	    }
	    else {
		#else add the highest of the total sum found
		if ($total > 0) {
		    $average[$i] += ($totalPredicted/$total);
		}
		#else, total sum is 0 and nothing needs to be added
	    }
	}
    }
    #my $numToAverage = scalar keys %{$cumulativeSumsRef};
    for (my $i = 0; $i < scalar @average; $i++) {
	$average[$i]/= $numToAverage;
    }

<<<<<<< HEAD

    #calculate the area under the curve
    my $auc = 0;
    for (my $i = 1; $i < scalar @average; $i++) {
        #auc += length*height                                                 
	# length is the x-axis width, (always 1, since its rank)         
	# height is the y-axis height = average[$i]
	# Thereofre, auc = sum(1*average[i]) = sum ($average)
	$auc += ($average[$i])
    }



=======
>>>>>>> 396740052140c61f1ee1fed75122a41212ab4bca
####### Output results

    #output the results
    open OUT, ">$outFile" or die ("ERROR: cannot open outFile: $outFile\n");

    #print out title row
<<<<<<< HEAD
    print OUT "average, auc = $auc\t";
=======
    print OUT "average\t";
>>>>>>> 396740052140c61f1ee1fed75122a41212ab4bca
    foreach my $cui (sort keys %{$cumulativeSumsRef}) {
	print OUT "$cui\t"
    }
    print OUT "\n";

    #output the average cumulative sum and each individual
    # cumulative sum. Since we compute for each individual, and 
    # these vary in length, keep printing until we have printed
    # every (meaning no more cumulative sums are defined)
    my $somethingDefined = 1;
    my $i = 0;
    while ($somethingDefined > 0) {
	#assume nothing defined
	$somethingDefined = 0;
 
	#print average as first column
	if (defined $average[$i]) {
	    print OUT "$average[$i]";
	    $somethingDefined = 1;
	}
	print OUT "\t";

	#print individual cumulative sums
	foreach my $cui (sort keys %{$cumulativeSumsRef}) {
	    if (defined ${${$cumulativeSumsRef}{$cui}}[$i]) {
		print OUT "${${$cumulativeSumsRef}{$cui}}[$i]";
		$somethingDefined = 1;
	    }
	    print OUT "\t";
	}
	print OUT "\n";
	$i++;
    }
    close OUT;
}


# Reads a vector file into a hash of hashes: %hash{$cui1}=\%hash{$cui2} = $score.
#   the first hash contains the association vectors of each $cui1, where as the second hash
#   is the score vector(sparse format), where $cui1 has an association with $cui2 = $score
#
#   Input:  fileName - fileName of the score vector file
#   Output: \%scores - hash of score vector (stored as a hash: \%hash{$cui1}=\%hash{$cui2}=$score)
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
	    
	    #TODO - what is happening with T200?
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


#Reads the known relations into memory
# Only reads in relations for which a vector exists
sub readMatrixFile {
    my $matrixFile = shift;
    my $vectorsRef = shift;

    #read the known relations into memory ${$hash{$cui1}}{$cui2} = 1
    open IN, $matrixFile or die ("ERROR: unable to open $matrixFile\n");
    my %knownRelations = ();
    my %vocabulary = ();
    while (my $line = <IN>) {
        #line is cui\tcui\tcount
	my @vals = split(/\t/,$line);
        my $cui1 = $vals[0];
        my $cui2 = $vals[1];
        if (!defined $cui1 || !defined $cui2) {
            die ("ERROR: cui1 or cui2 is not defined, line = $line");
        }

	#add both cuis to the vocabulary
	$vocabulary{$cui1} = 1;
	$vocabulary{$cui2} = 1;

	#only grab relations for the start cuis
	if (defined ${$vectorsRef}{$cui1}) {
	    #create the list of co-occurring terms if needed and add cui2
	    if (!defined $knownRelations{$cui1}) {
		my %newHash = ();
		$knownRelations{$cui1} = \%newHash;
	    }
	    ${$knownRelations{$cui1}}{$cui2} = 1;
	}
    }
    close IN;

    return \%knownRelations, \%vocabulary;
}
