#!/usr/bin/perl -w

use strict;

use vars qw ();

#my $in_f = "/home/jibmaird/Projects/RelExt_error_analysis/Data/CP17/4CNN-4MHA.table";
my $in_f = $ARGV[0];
my $size = 5;

open(I,$in_f)||die;
$_ = <I>;
chomp;
my @T = split(/\,/,$_);
shift @T;
shift @T;
undef my %H;
while(<I>) {
    chomp;
    
    my @F = split(/\,/,$_);

    $_ = int($F[1] / $size);

#    print "$F[1] $_\n";
    
    $H{$_}{$T[0]}{$F[2]}++;
    $H{$_}{$T[1]}{$F[3]}++;
}
close(I);

print "Distance\t$T[0] Recall\tTP\tFN\t$T[1] Recall\tTP\tFN\n";
foreach my $d (sort {$a<=>$b} keys %H) {
    my $aux = $d * $size;
    $_ = $aux + $size - 1;
    print "$aux\-$_";
    foreach my $t (@T) {

	$H{$d}{$t}{TP} = 0 if not defined $H{$d}{$t}{TP};
	$H{$d}{$t}{FN} = 0 if not defined $H{$d}{$t}{FN};

	my $r = 0;
	$r = $H{$d}{$t}{TP} / ($H{$d}{$t}{TP} + $H{$d}{$t}{FN}) if $H{$d}{$t}{TP} > 0;
	printf("\t%1.2f",$r);
	print "\t$H{$d}{$t}{TP}\t$H{$d}{$t}{FN}";
    }
    print "\n";
}
