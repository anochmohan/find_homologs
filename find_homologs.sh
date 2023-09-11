#!/bin/bash

#Takes in query file
query_file="$1"

#Takes in subject file
subject_file="$2"

#Takes in output file
output_file="$3"

#BLAST query
tblastn -query $query_file -subject $subject_file -task tblastn-fast -outfmt '6 std qlen' | awk '$3>30 && $12>90' > $output_file

#Print number of matches identified
match="$(wc -l < $output_file)"
echo "There were $match matches identified."