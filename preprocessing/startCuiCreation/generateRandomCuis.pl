#Calculate the assocaition between a single term and every other term
# in the vocabulary. But this version randomly selected $numOfEachType 
# CUIs of each of the listed $semanticTypes. In this way the association
# vectors for each type are generated
use strict;
use warnings;
use UMLS::Interface;
use UMLS::Association;

####################################
#       User Input
####################################
#T200 - clnd - Clinical Drug
#T121 - phsu - Pharmacologic Substance
#T047 - dsyn - Disease or Syndrome
#T184 - sosy - Sign or Symptom
my @semanticTypes = ('T200','T121','T047','T184');
my $numOfEachType = 50;
my $matrixName = '1975_1999_window8_ordered_threshold1';
my $outBaseFile = 'randomCuis';




########################################
#  Initialize the UMLS::Interface
########################################
my %tHash = ();
$tHash{'t'} = 1; #default hash values are with t=1 (silence module output)
my $componentOptions = \%tHash;
# use default configuration
my $umls_interface = UMLS::Interface->new($componentOptions) 
    or die "Error: Unable to create UMLS::Interface object.\n";

#get each unique vocab term and its semantic type
my $matrixFile = "../../data/lbdData/$matrixName";
open IN, $matrixFile or die ("Error: unable to open matrix: $matrixFile\n");
my %vocabulary = ();
my $type;
while (my $line = <IN>) {
    my @vals = split(/\t/, $line);
    #lines are cui1\tcui2\tcooccurrenceCount
    
    #add cuis and their semantic type to the hash
    #add type of cui1
    $type = ${$umls_interface->getSt($vals[0])}[0];
    if (!defined $type) {
	$type = '';
    }
    $vocabulary{$vals[0]} = $type;

    #add type of cui2
    $type = ${$umls_interface->getSt($vals[1])}[0];
    if (! defined $type) {
	$type = '';
    }
    $vocabulary{$vals[1]} = $type;
}
close IN;

################################################################
# Randomly select and Create vectors for all of the cuis
################################################################
foreach my $semanticType (@semanticTypes) {

    #grab $numOfEachType of this type
    my @cuis = ();
    my $count = 0;
    foreach my $cui (keys %vocabulary) {
	if ($vocabulary{$cui} eq $semanticType) {
	    push @cuis, $cui;
	    $count++;
	    if ($count >= $numOfEachType) {
		last;
	    }
	}
    }
    if ($count < $numOfEachType) {
	die ("ERROR: only $count cuis of $semanticType.\n");
    }

    my $outFileName = "$outBaseFile"."_$semanticType";
    open OUT, ">$outFileName" or die ("ERROR: cannot open $outFileName");
    foreach my $cui (@cuis) {
	print OUT "$cui\n";
    }
}
