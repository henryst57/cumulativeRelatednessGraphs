#script to combine multiple vector files into a single one
# used to combine T047, T121, T184, T200 into all
use strict;
use warnings;

### USER INPUT ####
### Combine coocABC and predicateABC semantic type files into an all file
#LTC
my @types = ('T047', 'T121', 'T184', 'T200');
my $rootFileName = '../../../preprocessedData/vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_';
my $tailFileName = '_lta_coocABC';
my $outType = 'all';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);
$tailFileName = '_lta_predicateABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#word2vecCosine
$rootFileName = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_coocABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);
$tailFileName = '_predicateABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#explicitCosine
$rootFileName = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_coocABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);
$tailFileName = '_predicateABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#SBC
$rootFileName = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_sbc_coocABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);
$tailFileName = '_sbc_predicateABC';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);


### Combine all term vector files into one
#explicit cosine
$rootFileName = '../../../preprocessedData/vectors_explicitCosine_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#ltc
$rootFileName = '../../../preprocessedData/vectors_freq_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_lta';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#random
$rootFileName = '../../../preprocessedData/vectors_random_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#word2vec
$rootFileName = '../../../preprocessedData/vectors_word2vecCosine_1975_1999_window8_randomCuis_';
$tailFileName = '';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#direct x2
$rootFileName = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#lsa
$rootFileName = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_lsa';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#lta
$rootFileName = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_lta';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#mwa
$rootFileName = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_mwa';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#sbc
$rootFileName = '../../../preprocessedData/vectors_x2_1975_1999_window8_ordered_threshold1_randomCuis_';
$tailFileName = '_sbc';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);

#future direct x2 (ideal)
$rootFileName = '../../../preprocessedData/vectors_x2_1975_2015_window8_threshold1_randomCuis_';
$tailFileName = '';
&combineVectorFiles(\@types, $rootFileName, $tailFileName, $outType);



###############################################
#               Begin Code
###############################################
#Combines the files of each type and outputs to the outType
sub combineVectorFiles {
    my $typesRef = shift;
    my $rootFileName = shift;
    my $tailFileName = shift;
    my $outType = shift;

    #combine strings into file names
    my @fileNames = ();
    foreach my $type (@{$typesRef}) {
	push @fileNames, $rootFileName.$type.$tailFileName;
    }

    #concatenate the vector files into a single one
    my $outFile = $rootFileName.$outType.$tailFileName;
    open OUT, ">$outFile" or die ("ERROR: unable to open outFile: $outFile\n");
    foreach my $inFile(@fileNames) {
	open IN, $inFile or die ("ERROR: unable to open inFile: $inFile\n");
	while (my $line = <IN>) {
	    print OUT $line;
	}
	close IN;
    }
    close OUT;

    print "Done!\n";
}
