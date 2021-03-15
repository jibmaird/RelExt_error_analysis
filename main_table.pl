#!/usr/bin/perl -w

use strict;

use vars qw ();

#my @File = ("Gold","TEES","1MHA","4MHA","4MHA-4CNN","4CNN-4MHA");
#my @Corpus = ("AMIA","CP17");
#DEBUG
my @Corpus = ("CP17");

foreach my $c (@Corpus) {

    my $data_d = "Data/$c";

#DEBUG
    my @File = ("4MHA");
    
    foreach my $f (@File) {
	#system("./extract_rel_dist.pl $data_d/$f.xml $data_d/$f.rels"); #deprecated
	
#	system("python /home/jibmaird/Projects/TEES-master/preprocess.py -i $data_d/$f.xml -o $data_d/$f\_split.xml --steps LOAD,SPLIT_NAMES");
	
#	system("python /home/jibmaird/Projects/TEES-master/Utils/DistanceAnalyzer2.py -i $data_d/$f\_split.xml > $data_d/$f\_split.rels");
	
	if (($f ne "Gold")&&($f ne "TEES")) {
#	    system("./merge_tables.pl $data_d/Gold\_split.rels $data_d/$f\_split.rels $data_d/TEES\_split.rels > $data_d/$f.table.txt");
#	    system("./merge_tables_prec.pl $data_d/Gold\_split.rels $data_d/$f\_split.rels $data_d/TEES\_split.rels > $data_d/$f.table_prec.txt");


#	    system("./recall_by_distance.pl $data_d/$f.table.txt > $data_d/$f.table_recall.txt");

#	    system("./recall_by_distance_bucket.pl $data_d/$f.table.txt > $data_d/$f.table_recall_bucket.txt");
#	    system("./prec_by_distance_bucket.pl $data_d/$f.table_prec.txt > $data_d/$f.table_prec_bucket.txt");


#	    system("./group_long_dist.pl $data_d/$f.table_recall_bucket.txt > $data_d/$f.table_recall_bucket_group.txt");
#	    system("./group_long_dist_prec.pl $data_d/$f.table_prec_bucket.txt > $data_d/$f.table_prec_bucket_group.txt");

#	    system("./f1_grouped_tables.pl $data_d/$f.table_prec_bucket_group.txt $data_d/$f.table_recall_bucket_group.txt > $data_d/$f.table_f1_bucket_group.txt");


#	    system("python create_graph.py $data_d/$f.table_recall_bucket_group.txt $data_d/$f.png $f");
#	    system("python create_graph_prec.py $data_d/$f.table_prec_bucket_group.txt $data_d/$f.prec.png $f");
#	    system("python create_graph_f1.py $data_d/$f.table_f1_bucket_group.txt $data_d/$f.f1.png $f");

	}
    }
}

