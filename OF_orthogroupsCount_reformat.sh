#!/bin/bash
# !!! Orthofinder orthogroups count file is deprecated; suggested N0 counts !!!
of_gene_count_table="$1"

#1.
awk -F'\t' '{print "(null)\t"$0}' "$of_gene_count_table" > tmp.tsv

#2. remove the total column from above, without needed to figure out column numbers.
awk -F'\t' '{$NF=""; print $0}' tmp.tsv | rev | sed 's/^\s*//g' | rev | tr ' ' '\t' > mod.tsv

echo "DONE!"

echo "------------------------------------------------------- "
echo " **IMP** Change the header (null) to 'Desc' and save & then run size filter !! "
