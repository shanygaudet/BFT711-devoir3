#!/bin/bash
 
#Description : write the list of unique chromosomes from the regions with a higher score than an x threshold, in a file with the prefix "chrom_higher_than_<threshold>_score_"

#Usage : chrom_higher_than_threshold_scores.sh <file> <threshold>

#Obtain filename
NAME=$(basename $1)

#Select the chromosome column (1st column) of the regions with a score higher than the x threshold in the .bed file, sort the chromosomes, select the unique chromosomes, then redirect
awk -v THRESHOLD=$2 '$5 > THRESHOLD {print $1}' $1 | sort -V | uniq >> chrom_higher_than_${2}_scores_${NAME}  


