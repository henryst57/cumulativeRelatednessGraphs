open IN, "cTerms_raynaud_full" or die ("ERROR");

while (my $line = <IN>){
    my @vals = split(/,/,$line);
    print (scalar @vals)."\n";
}
