# Generates association vectors for every cui in the cui file
# and outputs them to file. The output file format is one cui 
# association vector per line, and in sparse format. So the line
# contains: CUI_FOR_LINE<>NONZERO_CUI,SCORE<>NONZERO_CUI,SCORE<>...\n
#use strict;
#use warnings;
use lib '/home/henryst/UMLS-Association/lib';
use UMLS::Association;
use Getopt::Long;


####################################
#        Grab Input
####################################
eval(GetOptions("version", "help", "debug",  "measure=s", "noorder", "lta", "mwa", "lsa", "sbc", "wsa", "nonorm","cuiFile=s", "matrixName=s", "matrixFolder=s", "increment=s", "atonce")) or die ("Please check the above mentioned option(s).\n");

#TODO - add help, version ... so user can actually get a response when they use them
if ($opt_help) {
    #&_showHelp();
}
if ($opt_version) {
    #&_showVersion();
}

#check required parameters are defined 
if (!$opt_measure) {
    die ("ERROR: measure must be defined\n");
}
if (!$opt_matrixName) {
    die ("ERROR: matrixName must be defined\n");
}
if (!$opt_matrixFolder) {
    die ("ERROR: matrixFolder must be defined\n");
}
if (!$opt_cuiFile) {
    die ("ERROR: cuiFile must be defined\n");
}
if (!$opt_increment) {
    $opt_increment = 9999999999;
}

#convert options to parameters
my %params = ();
$params{'matrix'} = $opt_matrixFolder.$opt_matrixName;
$params{'increment'} = $opt_increment;
if ($opt_noorder) { 
    $params{'noorder'} = 1; 
}
if ($opt_lta) { 
    $params{'lta'} = 1;
}
if ($opt_mwa) { 
    $params{'mwa'} = 1;
}
if ($opt_lsa) { 
    $params{'lsa'} = 1;
}
if ($opt_sbc) { 
    $params{'sbc'} = 1;
}
if ($opt_wsa) { 
    $params{'wsa'} = 1;
}
if ($opt_nonorm) {
    $params{'nonorm'} = 1;
}
if ($opt_measure) { 
    $params{'measure'} = $opt_measure;
} 

#get the vocabulary
my ($vocabularyHashRef) = &getVocabulary($opt_matrixName, $opt_matrixFolder);

#generate the vector files, either all at once, or one vector at a time
if ($opt_atonce) {
#Newer, all at once method
    &generateVectorsForFile_atOnce($opt_cuiFile, $vocabularyHashRef, $opt_matrixName, $opt_matrixFolder, \%params);
}    
else {   
#older, one at a time method
    &generateVectorsForFile($vocabularyHashRef, $opt_cuiFile, $opt_matrixName, $opt_matrixFolder, \%params);
}
##########################################
# Initializes the system
##########################################
sub getVocabulary {
    my $matrixFile = shift;
    my $matrixFolder = shift;

    # Get the vocabulary in the file 
    open IN, $matrixFolder.$matrixFile or die ("ERROR: unable to open matrix: $matrixFolder$matrixFile\n");
    my %vocabulary = ();
    while (my $line = <IN>) {
	#lines are cui1\tcui2\tcooccurrenceCount
	my @vals = split(/\t/, $line);
		
	#add the cuis to the hash
	$vocabulary{$vals[0]} = 1;
	$vocabulary{$vals[1]} = 1;
    }
    close IN;

    return \%vocabulary;
}


########################################################################################################
#           All at once
########################################################################################################


##########################################
# Generates the associaiton between each start term and every other term in the vocabulary
##########################################
sub generateVectorsForFile_atOnce {
    #grab the input parameters
    my $startTermsFile = shift;
    my $vocabularyHashRef = shift;
    my $matrixName = shift;
    my $matrixFolder = shift;
    my $params = shift;

####################################
#       Output file naming
####################################
#make matrix file name and output filename relevent to the params
    my $outFile = 'vectors_'.$params->{'measure'}.'_'.$matrixName.'_'.$startTermsFile;
    if ($params->{'noorder'} > 0) {
	$outFile .= '_noOrder';
    }
    if ($params->{'lta'}) {
	$outFile .= '_lta';
    }
    if ($params->{'mwa'}) {
	$outFile .= '_mwa';
    }
    if ($params->{'lsa'}) {
	$outFile .= '_lsa';
    }
    if ($params->{'sbc'}) {
	$outFile .= '_sbc';
    }
    if ($params->{'wsa'}) {
	$outFile .= '_wsa';	
	if ($params->{'nonorm'}) {
	    $outFile .= '_nonorm';
	}
    }
        
##################################################
#               Initialization
##################################################
#  Initialize UMLS::Association
    my $association = UMLS::Association->new($params); 
    die "Unable to create UMLS::Association object.\n" if(!$association);
    
# Read in Start Terms
    my @startTerms = ();
    open CUI_IN, $startTermsFile or die ("ERROR: cannot open cuiFile: $startTermsFile\n");
    while (my $term = <CUI_IN>) {
	chomp $term;
	push @startTerms, $term;
    }
    close CUI_IN;

# Construct Pair Hash List
    my @cuiPairs = ();
    foreach my $startTerm (@startTerms) {
	foreach my $targetTerm (keys %{$vocabularyHashRef}) {
	    push @cuiPairs, "$startTerm,$targetTerm";
	}
    }
    
##################################################
#   Calculate Associaiton and Output Results
##################################################
# Calculate Association for everything
    my $scoresRef = $association->calculateAssociation_termPairList(\@cuiPairs, $params->{'measure'});

# Output the association vectors to file
    open OUT, ">$outFile" or die ("ERROR: unable to open outFile: $outFile\n");
    #grab the first start term
    (my $cui1, my $cui2) = split(',',$cuiPairs[0]);
    my $startTerm = $cui1;
    print OUT "$startTerm";

    #output all pairs, when a new start term begins, start 
    # a new line, since the cui pairs are ordered first by start
    # term this means each line is a new vector for that start term
    for (my $i = 0; $i < scalar @cuiPairs; $i++) {
	#granb the cui pair
	($cui1, $cui2) = split(',',$cuiPairs[$i]);
	
	#if a new start term, start a new line
	if ($cui1 ne $startTerm) {
	    print OUT "\n";
	    print OUT "$cui1";
	    $startTerm = $cui1;
	}
	
	#print the score with cui2 only if its > 0
        if (${$scoresRef}[$i] > 0) {
	    print OUT "<>$cui2,${$scoresRef}[$i]";
	}
    } 
    print OUT "\n";
    close OUT;
}




#############################################################################################################
#    IN SERIAL
#############################################################################################################




##########################################
# generates association vectors for all cuis in a file
##########################################
sub generateVectorsForFile {
    my $vocabularyHashRef = shift;
    my $cuiFile = shift;
    my $matrixName = shift;
    my $matrixFolder = shift;
    my $params = shift;

    # generate the assocation vector for each CUI in the file
    my $count = 0;
    my $elapsedTime = 0;
    my $startTime = 0;
    open CUI_IN, $cuiFile or die ("ERROR: cannot open cuiFile: $cuiFile\n");
    while (my $cui = <CUI_IN>) {
	$startTime = time();
	chomp $cui;
	&getAssociationRow($cui, $matrixName, $matrixFolder, $vocabularyHashRef, $cuiFile, $params);
	$count++;
	$elapsedTime = time() - $startTime;
	print STDERR "----------------Got row number $count in $elapsedTime seconds\n";
    }
}

##########################################
# Generates the associaiton between a term and every other term in the vocabulary
##########################################
sub getAssociationRow {
    #grab the input parameters
    my $startCui = shift;
    my $matrixName = shift;
    my $matrixFolder = shift;
    my $vocabularyHashRef = shift;
    my $cuiFile = shift;
    my $params = shift;
    
####################################
#       Output file naming
####################################
#make matrix file name and output filename relevent to the params
    my $outFile = 'vectors_'.$params->{'measure'}.'_'.$matrixName.'_'.$cuiFile;
    if ($params->{'noorder'} > 0) {
	$outFile .= '_noOrder';
    }
    if ($params->{'lta'}) {
	$outFile .= '_lta';
    }
    if ($params->{'mwa'}) {
	$outFile .= '_mwa';
    }
    if ($params->{'lsa'}) {
	$outFile .= '_lsa';
    }
    if ($params->{'sbc'}) {
	$outFile .= '_sbc';
    }
    if ($params->{'wsa'}) {
	$outFile .= '_wsa';	
	if ($params->{'nonorm'}) {
	    $outFile .= '_nonorm';
	}
    }
        
##################################################
#               Initialization
##################################################
#  Initialize UMLS::Association
    my $association = UMLS::Association->new($params); 
    die "Unable to create UMLS::Association object.\n" if(!$association);
   
#get the association between the start term and every term
# in the vocabulary. Since the matrix is too big to read into 
# memory at once, this is done in $increment CUI increments
    my $index = 0;
    my $increment = $params->{'increment'};
    open OUT, ">>$outFile" or die("ERROR: unable to open outFile: $outFile\n");
    print OUT "$startCui<>";
    my @cuis = keys %{$vocabularyHashRef};
    while ($index < scalar @cuis) {
	#calculate $increment cui pair associations
	my @cuiPairs = ();
	for (my $i = 0; $i < $increment; $i++) {
	    push @cuiPairs, "$startCui,$cuis[$index]";
	    $index++;
	    
	    #stop adding if there are no more cuis to add
	    if ($index >= scalar @cuis) {
		last;
	    }
	}

	#calculate $increment cui associations
	#print STDERR "   calculating up to $index out of ".(scalar @cuis)."\n";
	my $scoresRef = $association->calculateAssociation_termPairList(\@cuiPairs, $params->{'measure'});
	
	#output the $increment associations to file
	for (my $i = 0; $i < scalar @cuiPairs; $i++) {
	    (my $cui1, my $cui2) = split(',',$cuiPairs[$i]);
	    if (${$scoresRef}[$i] > 0) {
		print OUT "$cui2,${$scoresRef}[$i]<>";
	    }
	} 
    }
    print OUT "\n";
    close OUT;
}
