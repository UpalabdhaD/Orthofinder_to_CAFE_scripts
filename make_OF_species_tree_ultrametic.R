#!/usr/bin/R Rscript
# adapted from biostar dariobar answer
args = commandArgs(trailingOnly=TRUE)



library(ape)
library(data.table)

tre <- read.tree(args[1])
stopifnot(is.binary(tre))
stopifnot(is.rooted(tre))

if(is.ultrametric(tre)) {
    utre <- tre
} else{
    utre <- chronos(tre)
}
write.tree(utre, 'SpeciesTree_Ofinder_rooted_ultra.txt')
