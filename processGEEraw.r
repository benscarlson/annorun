
args <- commandArgs(trailingOnly=TRUE)
rawP <- args[1]
outPF <- args[2]
joinToPF <- args[3]

if(is.na(rawP)) stop('Path to raw GEE results is required')

library(glue)
library(readr)

library(devtools)
install_local('~/projects/anno',dependencies=FALSE,quiet=TRUE) #won't install unless code changed
library(anno)

joinToDat <- readr::read_csv(joinToPF,col_types=readr::cols())

dat <- processGEEraw(rawP,joinToDat)

message(glue('Writing dataset {outPF}...'))
write_csv(dat,outPF)
