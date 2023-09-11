#!/bin/bash

#Takes in query file
query_file="$1"

#Takes in subject file
subject_file="$2"

#Takes in output file
output_file="$3"

#BLAST query
tblastn -query $query_file -subject $subject_file -task blastn-short -outfmt '6 std qlen' | awk"$3>30 && $13>90" > $output_file

#Find perfect match
#match="$(grep -f $query_file $output_file | wc -l)"
#echo $match