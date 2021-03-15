#!/usr/bin/perl -w

use strict;

use vars qw ();

#my $in_f = "/home/jibmaird/Projects/RelExt_error_analysis/Data/CP17/4CNN-4MHA.table";
my $in_f = $ARGV[0];

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
    $H{$F[1]}{$T[0]}{$F[2]}++;
    $H{$F[1]}{$T[1]}{$F[3]}++;
}
close(I);

print "Distance,$T[0] Accum. Recall,TP,FN,$T[1] Accum. Recall,TP,FN\n\n";
undef my %Accum;
foreach my $d (sort {$a<=>$b} keys %H) {
    print "$d";
    foreach my $t (@T) {

	$H{$d}{$t}{TP} = 0 if not defined $H{$d}{$t}{TP};
	$H{$d}{$t}{FN} = 0 if not defined $H{$d}{$t}{FN};
	$Accum{$t}{tp} += $H{$d}{$t}{TP};
	$Accum{$t}{fn} += $H{$d}{$t}{FN};
	my $r = 0;
	$r = $Accum{$t}{tp} / ($Accum{$t}{tp} + $Accum{$t}{fn}) if $Accum{$t}{tp} > 0;
	printf(",%1.2f",$r);
	print ",$Accum{$t}{tp},$Accum{$t}{fn}";
    }
    print "\n";
}
