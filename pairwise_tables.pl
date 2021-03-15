#!/usr/bin/perl -w

use strict;

use vars qw ();

my $s1 = "4MHA-4CNN";
my $s2 = "4MHA";

my @F = ("prec","recall","f1");
foreach (@F) {
    my $tees_col = 4;
    $tees_col = 2 if $_ eq "f1";
    system("python create_graph_3col.py Data/CP17/$s1.table\_$_\_bucket_group.txt Data/CP17/$s2.table\_$_\_bucket_group.txt $s1 $s2 $_ Data/CP17/$s1\-$s2\.$_\_3col.png $tees_col");
}
