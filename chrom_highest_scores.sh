#!/bin/bash
 
#Description : write the list of unique chromosomes from the regions with the N highest scores in a file with the prefix "chrom_<nb_highest_scores>_highest_scores_"

#Usage : chrom_highest_scores.sh <file> <nb_highest_scores>

#Obtain filename
NAME=$(basename $1)

#Sort lines by score (column #5) from highest to lowest from the .bed file, select the first N lines, cut the chromosome column (column #1), sort the chromosomes, select the unique chromosomes, then redirect
sort -nrk 5 "$1" | head -n $2 | cut -f 1 | sort -V | uniq >> chrom_${2}_highest_scores_${NAME}


