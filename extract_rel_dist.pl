#!/usr/bin/perl -w

use strict;

use vars qw ();

#my $in_f = "/home/jibmaird/Documents/papers/emnlp2019/Gold.xml";
#my $out_f = "Data/Gold.rels";

my $in_f = $ARGV[0];
my $out_f = $ARGV[1];

open(O,">$out_f")||die;

undef my %R;
undef my %E;
undef my %T;
open(I,$in_f)||die;
while(<I>) {
    chomp;
    if (/<sentence charOffset=\"(.*?)\".*?id=\"(.*?)\"/) {
	my $sent_id = $2;
	if (%R) {
	    foreach my $r (keys %R) {
		if (not defined $T{$E{$R{$r}{e1}}}) {
		    print "ENTITY TOKEN START DOES NOT MATCH: $r $R{$r}{e1}\n";
		}
		if (not defined $T{$E{$R{$r}{e2}}}) {
		    print "ENTITY TOKEN START DOES NOT MATCH: $r $R{$r}{e2}\n";
		}
		if ((defined $T{$E{$R{$r}{e1}}})&&
		    (defined $T{$E{$R{$r}{e2}}})) {
		    print O "$r $T{$E{$R{$r}{e1}}} $T{$E{$R{$r}{e2}}}\n";
		}
	    }
	}
	undef %R;
	undef %E;
	undef %T;
    }
    elsif (/<entity charOffset=\"(.*?)\-.*?\".*?id=\"(.*?)\"/) {
	$E{$2} = $1;
    }
    elsif (/<token .*? charOffset=\"(.*?)\-.*?\" id=\"t(.*?)\"/) {
	$T{$1} = $2;
    }
    elsif (/<interaction .*? e1=\"(.*?)\" e2=\"(.*?)\" id=\"(.*?)\"/) {
	$R{$3}{e1} = $1;
	$R{$3}{e2} = $2;
    }
}
close(I);
close(O);
