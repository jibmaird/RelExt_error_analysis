#!/usr/bin/perl -w

use strict;

use vars qw ();

my $gold = $ARGV[0];
my $pred = $ARGV[1];
my $pred2 = $ARGV[2];

#Read Gold
open(I,"$gold")||die;
undef my %G;
while(<I>) {
    chomp;
    my @F = split(/ /,$_);
    my $id = shift @F;
    my $pred_type = pop @F;
    @F = sort {$a <=> $b} @F;
    $_ = $F[1]-$F[0];
    my @G = split(/\./,$id);
    $G{"$G[1].$G[2].$F[0].$F[1]"}=$pred_type;
}
close(I);

undef my %H;
my @P = ($pred,$pred2);
foreach my $p (@P) {
    open(I,"$p")||die "$p\n";
    while(<I>) {
	chomp;
	my @F = split(/ /,$_);
	my $id = shift @F;
	my $pred_type = pop @F;
	@F = sort {$a <=> $b} @F;
	$_ = $F[1]-$F[0];
	my @G = split(/\./,$id);

	if ((defined $G{"$G[1].$G[2].$F[0].$F[1]"})&&
	    ($G{"$G[1].$G[2].$F[0].$F[1]"} eq $pred_type)){
	    $H{"$G[1].$G[2].$F[0].$F[1],$_"}{$p} = "TP"
	}
	else {
	    $H{"$G[1].$G[2].$F[0].$F[1],$_"}{$p} = "FP"
	}
    }
    close(I);
}


print "Id,distance,$P[0],$P[1]\n";
foreach my $k (sort keys %H) {
    print "$k";
    foreach my $p (@P) {
	if (defined $H{$k}{$p}) {
	    print ",$H{$k}{$p}";
	}
	else {
	    print ",\-";
	}   
    }
    print "\n";
}
