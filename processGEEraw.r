
args <- commandArgs(trailingOnly=TRUE)
datName <- args[1]
if(is.na(datName)) stop('Dataset name is required')

library(glue)
library(readr)

library(devtools)
install_local('~/projects/anno',dependencies=FALSE,quiet=TRUE) #won't install unless code changed
library(anno)

dat <- processGEEraw(datName)
dat <- joinOrigData(dat,datName)

datF <- glue('{datName}_anno.csv')
message(glue('Writing dataset {datF}...'))
write_csv(dat,datF)
