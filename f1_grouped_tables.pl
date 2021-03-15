#!/usr/bin/perl -w

use strict;
use vars qw ();

my $prec_f = $ARGV[0];
my $rec_f = $ARGV[1];

open(P,$prec_f)||die "$prec_f\n";
open(R,$rec_f)||die "$rec_f\n";
$_ = <P>;
$_ = <R>;
s /Recall/F1/g;
my @F = split(/\t/,$_);
print "$F[0]\t$F[1]\t$F[4]\n";
while(<P>) {

    chomp;
    my @P = split(/\t/,$_);
    $_ = <R>;
    chomp;
    my @R = split(/\t/,$_);
    my $f1 = 0;
    my $f2 = 0;
    $f1 = 2* $P[1] * $R[1] / ($P[1] + $R[1]) if ($P[1] + $R[1]) > 0;
    $f2 = 2* $P[4] * $R[4] / ($P[4] + $R[4]) if ($P[4] + $R[4]) > 0;
    print "$P[0]\t";
    printf("%1.2f\t%1.2f\n",$f1,$f2);
    
}
close(P);
close(R);
