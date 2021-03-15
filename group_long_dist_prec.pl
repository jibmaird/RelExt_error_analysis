#!/usr/bin/perl -w

use strict;

use vars qw ();

open(I,$ARGV[0])||die;
my $tp_tees = 0;
my $fp_tees = 0;
my $tp_ours = 0;
my $fp_ours = 0;
while(<I>) {
    chomp;
    if ((/^(\d+)/)&&($1>14)) {
	my @F = split(/\t/,$_);
	$tp_tees += $F[5];
	$fp_tees += $F[6];
	$tp_ours += $F[2];
	$fp_ours += $F[3];
    }
    else {
	print "$_\n";
    }
}
close(I);

my $r = 0;
$r = $tp_ours / ($tp_ours + $fp_ours) if $tp_ours > 0;
printf("15\-\t%1.2f",$r);
print "\t$tp_ours\t$fp_ours";
$r = $tp_tees / ($tp_tees + $fp_tees) if $tp_tees > 0;
printf("\t%1.2f",$r);
print "\t$tp_tees\t$fp_tees\n";


