# Generates vectors of random scores for each cui in the $cuisFile versus 
# every word in the vocabulary of the $matrix file. Results are output to 
# the $outFile.
# These random scores are used as a random baseline in evaluation.
use strict;
use warnings;

############################################################
#  User Input
############################################################
#matrix file containing all words in the current vocabulary
my $matrixFile = '../../../rawData/1975_1999_window8_ordered_threshold1';

#cuis file containing cuis to generate random vectors for
my $cuisFile = '../../../startCuis/randomCuis_T047';

#file to output the random vectors to
my $outFile = 'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_T047';
    
#create the random vector
&createRandomOut($matrixFile, $cuisFile, $outFile);


#Create Random Vectors for other types
$matrixFile = '../../../rawData/1975_1999_window8_ordered_threshold1';
$cuisFile = '../../../startCuis/randomCuis_T121';
$outFile = 'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_T121';
&createRandomOut($matrixFile, $cuisFile, $outFile);
$matrixFile = '../../../rawData/1975_1999_window8_ordered_threshold1';
$cuisFile = '../../../startCuis/randomCuis_T184';
$outFile = 'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_T184';
&createRandomOut($matrixFile, $cuisFile, $outFile);
$matrixFile = '../../../rawData/1975_1999_window8_ordered_threshold1';
$cuisFile = '../../../startCuis/randomCuis_T200';
$outFile = 'vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_T200';
&createRandomOut($matrixFile, $cuisFile, $outFile);



############################################################
#  Begin Code
############################################################


# Creates a cumulative function using random rankings
sub createRandomOut {
    my $currentMatrixFile = shift;
    my $cuisFile = shift;
    my $outFile = shift;

    #read in the cuis file
    open IN, $cuisFile 
	or die ("ERROR: cannot open cuisFile: $cuisFile\n");
    my %cuis = ();
    while (my $line = <IN>) {
	#file has a single cui per line
	chomp $line;
	$cuis{$line} = 1;
    }
    close IN;
    
    #read in the vocabulary by reading in the matrix file
    open IN, $currentMatrixFile 
	or die ("ERROR: cannot open currentMatrixfile: $currentMatrixFile\n");
    my %vocab = ();
    while (my $line = <IN>) {
	#matrix is of the format cui cui score, and is tab seperated
        my @vals = split (/\t/,$line);
	$vocab{$vals[0]}=1;
	$vocab{$vals[1]}=1;
    }
    close IN;

    #generate random score vectors for each CUI vs. each word in vocab
    # output the vectors as they are generated
    # random numbers are between 0 and 1
    open OUT, ">$outFile" 
	or die ("ERROR: cannot open outFile: $outFile\n");
    foreach my $cui1 (keys %cuis) {
	#output format is cui1<>cui2,score<>cui2,score<>...
	print OUT "$cui1";
	foreach my $cui2 (keys %vocab) {
	    print OUT "<>$cui2,".(rand());
	}
	print OUT "\n";
    }
    close OUT;
}
