#!/usr/bin/perl
#extracts data from vectors and puts into a format suitable for calculating
# correlations between scores
use strict;
use warnings;



print "########################## vs Word2Vec\n";
my $directory = '/home/henryst/indirectEval/output/';
my $directFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
my $correlation;

##
my $predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
#my $correlation = &computeCorrelation($directFile, $predictedFile);
#print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
#$correlation = &computeCorrelation($directFile, $predictedFile);
#print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
#$correlation = &computeCorrelation($directFile, $predictedFile);
#print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
#$correlation = &computeCorrelation($directFile, $predictedFile);
#print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
#$correlation = &computeCorrelation($directFile, $predictedFile);
#print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec cosine: $correlation\n";



#####################################################
#####################################################

print "########################## vs Explicit Cosine\n";
$directory = '/home/henryst/indirectEval/output/';
$directFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';

##
$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
#$correlation = &computeCorrelation($directFile, $predictedFile);
#print STDERR "word2vec cosine: $correlation\n";


#####################################################
#####################################################

print "########################## vs SBC\n";
$directory = '/home/henryst/indirectEval/output/';
$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';

##
$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec cosine: $correlation\n";


#####################################################
#####################################################

print "########################## vs MWA\n";
$directory = '/home/henryst/indirectEval/output/';
$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';

##
$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec cosine: $correlation\n";

#####################################################
#####################################################

print "########################## vs LTA\n";
$directory = '/home/henryst/indirectEval/output/';
$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';

##
$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec cosine: $correlation\n";



#####################################################
#####################################################

print "########################## vs LTC\n";
$directory = '/home/henryst/indirectEval/output/';
$directFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';

##
$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec cosine: $correlation\n";


#####################################################
#####################################################

print "########################## vs Direct\n";
$directory = '/home/henryst/indirectEval/output/';
$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';

##
$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Direct: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_all_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "explicit cosine: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_all';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec cosine: $correlation\n";





=comment
#user input
my $directory = '/home/henryst/indirectEval/output/';
my $dataSet = 'T047';
print "############ $dataSet ###############\n";
my $directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
#my $directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#my $directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
my $predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
my $correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Future correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Current correlation is: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random correlation is: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Explicit Cosine correlation is: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec Cosine correlation is: $correlation\n";



#########################################################################################
$dataSet = 'T121';
print "############ $dataSet ###############\n";
$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
#$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
$predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Future correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Current correlation is: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random correlation is: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Explicit Cosine correlation is: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec Cosine correlation is: $correlation\n";



##########################################################################################
$dataSet = 'T184';
print "############ $dataSet ###############\n";
$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
#$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
$predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Future correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Current correlation is: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random correlation is: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Explicit Cosine correlation is: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec Cosine correlation is: $correlation\n";


##############################################################################################
$dataSet = 'T200';
print "############ $dataSet ###############\n";
$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
#$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
$predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly_futureOnly';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Future correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Ideal Current correlation is: $correlation\n";

$predictedFile = $directory.'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Random correlation is: $correlation\n";

$predictedFile = $directory.'vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_lta';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "LTA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_mwa';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "MWA correlation is: $correlation\n";

$predictedFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet.'_sbc';
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "SBC correlation is: $correlation\n";

$predictedFile = $directory.'vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "Explicit Cosine correlation is: $correlation\n";

$predictedFile = $directory.'vectors_word2vecCosine_1975_1999_window8_randomCuis_'.$dataSet;
$correlation = &computeCorrelation($directFile, $predictedFile);
print STDERR "word2vec Cosine correlation is: $correlation\n";

print "Done!\n";
=cut

#####################################################
#                   Begin Code
#####################################################
# computes the Pearson's correlation between all values 
# shared values between files A and B
sub computeCorrelation {
    #grab user input
    my $aFile = shift;
    my $bFile = shift;

    #read in the scores stored as vectors
    my $aScoresRef = &readVectorFile($aFile);
    my $bScoresRef = &readVectorFile($bFile);

=comment
    #output the shared values to a temp files to be read 
    # into spearmans.pl
    open OUT_A, ">TEMP_A" or die ("ERROR: unable to open TEMP_A\n");
    open OUT_B, ">TEMP_B" or die ("ERROR: unable to open TEMP_B\n");
     foreach my $pair (keys %{$aScoresRef}) {
	if (defined ${$bScoresRef}{$pair}) {
	    #output format is score<>cui<>cui
	    # and $pair is already of format cui<>cui
	    print OUT_A "${$aScoresRef}{$pair}<>$pair\n";
	    print OUT_B "${$bScoresRef}{$pair}<>$pair\n";
	}
     }
    close OUT_A;
    close OUT_B;
=cut

    #output the shared values to a temp files to be read 
    # into spearmans.pl
    open OUT_A, ">TEMP_A" or die ("ERROR: unable to open TEMP_A\n");
    open OUT_B, ">TEMP_B" or die ("ERROR: unable to open TEMP_B\n");
    my $count = 0;
    foreach my $pair (sort {${$aScoresRef}{$a} <=> ${$aScoresRef}{$b}} keys %{$aScoresRef}) {
	if (defined ${$bScoresRef}{$pair}) {
	    if (${$aScoresRef}{$pair} > 0 && ${$bScoresRef}{$pair} > 0) {
		#output format is score<>cui<>cui
		# and $pair is already of format cui<>cui
		print OUT_A "${$aScoresRef}{$pair}<>$pair\n";
		print OUT_B "${$bScoresRef}{$pair}<>$pair\n";
		$count ++;
	    }
	}
	if ($count >= 300) {
	    last;
	}
     }
    print STDERR "FINAL COUNT OUTPUT = $count\n";
    close OUT_A;
    close OUT_B;

    #compute the correlation between the values in file 1 and file 2
    my @spearmansOut = `perl spearmans.pl TEMP_A TEMP_B`;
    #spearmansOut[0] is line of n (e.g. "15922 : 15922")
    #spearmansOut[1] is line of score (e.g. "Spearman's Rank Correlation: 0.8396")

    #grab correlation from spearmansOut[1]
    chomp $spearmansOut[1];
    $spearmansOut[1] =~ s/Spearman's Rank Correlation: //;
    my $correlation = $spearmansOut[1];
    
    #clean up temp files
    `rm TEMP_A`;
    `rm TEMP_B`;

    #return correlation
    return $correlation;
}

# reads in a vector file of the format rowCui<>cui1,score<>cui2,score<>...
# into a hash of pair scores of the format hash{'cui1,cui2'}=score
sub readVectorFile {
    my $fileName = shift;

    #read the cuis and scores of the direct file
    my %scores = ();
    open IN, "$fileName" 
	or die ("ERROR: unable to open file: $fileName\n");
    while (my $line = <IN>) {
	#grab the values from the line
	my @pairs = split(/<>/, $line);

	#read in the scores for each row cui (the cui whose vector 
	# is on this line)
	my $rowCui = shift @pairs;
	
	#file is the format cui<>cui,score<>cui,score<>...
	# read in each value
	foreach my $pair (@pairs) {
	    my @vals = split(/,/, $pair);
	    #vals[0]=cui, vals[1]=score
	    if (!defined $vals[1]) {
		next;
	    }

	    $scores{"$rowCui<>$vals[0]"} = $vals[1];
	}
    }
    return \%scores;
}
