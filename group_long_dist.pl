#!/usr/bin/perl -w

use strict;

use vars qw ();

open(I,$ARGV[0])||die;
my $tp_tees = 0;
my $fn_tees = 0;
my $tp_ours = 0;
my $fn_ours = 0;
while(<I>) {
    chomp;
    if ((/^(\d+)/)&&($1>14)) {
	my @F = split(/\t/,$_);
	$tp_tees += $F[5];
	$fn_tees += $F[6];
	$tp_ours += $F[2];
	$fn_ours += $F[3];
    }
    else {
	print "$_\n";
    }
}
close(I);

my $r = 0;
$r = $tp_ours / ($tp_ours + $fn_ours) if $tp_ours > 0;
printf("15\-\t%1.2f",$r);
print "\t$tp_ours\t$fn_ours";
$r = $tp_tees / ($tp_tees + $fn_tees) if $tp_tees > 0;
printf("\t%1.2f",$r);
print "\t$tp_tees\t$fn_tees\n";


