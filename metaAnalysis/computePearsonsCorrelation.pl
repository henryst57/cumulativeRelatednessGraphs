#!/usr/bin/perl
#extracts data from vectors and puts into a format suitable for calculating
# correlations between scores
use strict;
use warnings;

#user input
my $directory = '/home/henryst/indirectEval/output/';
my $dataSet = 'T047';
print "############ $dataSet ###############\n";
my $directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#my $directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
my $predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
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



########################################################################################
$dataSet = 'T121';
print "############ $dataSet ###############\n";
$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
$predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
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



########################################################################################
$dataSet = 'T184';
print "############ $dataSet ###############\n";
$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
$predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
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


########################################################################################
$dataSet = 'T200';
print "############ $dataSet ###############\n";
$directFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
#$directFile = $directory.'vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_'.$dataSet;

#
$predictedFile = $directory.'vectors_x2_1975_2015_window8_threshold1_randomCuis_'.$dataSet.'_pastOnly';
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

    #convert to a shared values matrix
    # where column 1 is A values, and column 2 is
    # the corresponding B value. Each row represents
    # the set of values for a shared CUI pair
    my @rowPairs = (); #index of pair to row
    my $matrix = []; #matrix of values
    my $count = 1;
    #foreach my $pair (sort {${$aScoresRef}{$a} <=> ${$aScoresRef}{$b}} keys %{$aScoresRef}) {
    foreach my $pair (keys %{$aScoresRef}) {
	if (defined ${$bScoresRef}{$pair}) {
	    $matrix->[$count][1] = ${$aScoresRef}{$pair};
	    $matrix->[$count][2] = ${$bScoresRef}{$pair};
	    $rowPairs[$count] = $pair;
	    $count++;
	}
    }

    #compute the correlation between the values in file 1 and file 2
    my $correlation = &correlation($matrix);
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

	    $scores{"$rowCui,$vals[0]"} = $vals[1];
	}
    }
    return \%scores;
}



################################################
#              Correlation Code
################################################ 

#Correlation Code (all below) from https://davetang.org/muse/2010/11/29/calculating-pearson-correlation-using-perl/ 
#to use this code, remove the matrix code above
#generate an anonymous 2D array where $x->[1] is the row
#$x->[1][1] is the value in row 1 column 1 and $x->[1][2] is the value of row 1 column 2
#once you build the entire array, pass it to the correlation subroutine as above
#my $corrleation = correlation($x)
 
sub mean {
   my ($x)=@_;
   my $num = scalar(@{$x}) - 1;
   my $sum_x = '0';
   my $sum_y = '0';
   for (my $i = 1; $i < scalar(@{$x}); ++$i){
      $sum_x += $x->[$i][1];
      $sum_y += $x->[$i][2];
   }
   my $mu_x = $sum_x / $num;
   my $mu_y = $sum_y / $num;
   return($mu_x,$mu_y);
}
 
### ss = sum of squared deviations to the mean
sub ss {
   my ($x,$mean_x,$mean_y,$one,$two)=@_;
   my $sum = '0';
   for (my $i=1;$i<scalar(@{$x});++$i){
     $sum += ($x->[$i][$one]-$mean_x)*($x->[$i][$two]-$mean_y);
   }
   return $sum;
}
 
sub correlation {
   my ($x) = @_;
   my ($mean_x,$mean_y) = mean($x);
   my $ssxx=ss($x,$mean_x,$mean_y,1,1);
   my $ssyy=ss($x,$mean_x,$mean_y,2,2);
   my $ssxy=ss($x,$mean_x,$mean_y,1,2);
   my $correl=correl($ssxx,$ssyy,$ssxy);
   my $xcorrel=sprintf("%.4f",$correl);
   return($xcorrel);
 
}
 
sub correl {
   my($ssxx,$ssyy,$ssxy)=@_;
   my $sign=$ssxy/abs($ssxy);
   my $correl=$sign*sqrt($ssxy*$ssxy/($ssxx*$ssyy));
   return $correl;
}
