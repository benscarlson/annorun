#MOVED TO ANNO PACKAGE
args <- commandArgs(trailingOnly=TRUE)
rawP <- args[1]
outPF <- args[2]
joinToPF <- args[3]

if(is.na(rawP)) stop('Path to raw GEE results is required')

library(anno)
library(glue)
library(readr)

#TODO: this script is not very useful

joinToDat <- readr::read_csv(joinToPF,col_types=readr::cols())

dat <- processGEEraw(rawP,joinToDat)

message(glue('Writing dataset {outPF}...'))
write_csv(dat,outPF)
