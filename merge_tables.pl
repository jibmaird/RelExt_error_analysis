#!/usr/bin/perl -w

use strict;

use vars qw ();

my $gold = $ARGV[0];
my $pred = $ARGV[1];
my $pred2 = $ARGV[2];

#Read predictions

undef my %P;
my @P = ($pred,$pred2);
foreach my $p (@P) {
    open(I,"$p")||die "$p\n";
    while(<I>) {
	chomp;
	my @F = split(/ /,$_);
	my $id = shift @F;
	my $pred_type = pop @F;
	@F = sort {$a <=> $b} @F;
	my @G = split(/\./,$id);
	$P{$p}{"$G[1].$G[2].$F[0].$F[1]"}=$pred_type;
    }
    close(I);
}

#Print FN/TP
open(I,"$gold")||die;
print "Id,distance,$P[0],$P[1]\n";
while(<I>) {
    chomp;
    my @F = split(/ /,$_);
    my $id = shift @F;
    my $pred_type = pop @F;
    @F = sort {$a <=> $b} @F;
    $_ = $F[1]-$F[0];
    my @G = split(/\./,$id);

    print "$G[1].$G[2].$F[0].$F[1],$_";
    foreach my $p (@P) {

	if ((defined $P{$p}{"$G[1].$G[2].$F[0].$F[1]"})&&
	    ($P{$p}{"$G[1].$G[2].$F[0].$F[1]"} eq $pred_type)){
	    print ",TP";
	}
	else {
	    print ",FN";
	}
    }
    print "\n";
}
close(I);
