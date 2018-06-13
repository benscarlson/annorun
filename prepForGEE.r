args <- commandArgs(trailingOnly=TRUE)
datName <- args[1]
datP <- args[2]
if(is.na(datName)) stop('Dataset name is required')
if(is.na(datP)) stop('Path to datset is required')

library(dplyr)
library(readr)

library(devtools)
install_local('~/projects/anno',dependencies=FALSE,quiet=TRUE) #won't install unless code changed
library(anno)

testData <- read_csv(datP)

#wd <- getwd()
#setwd('~/scratch/anno')
prepForGEE(dat=testData,datName=datName)
#setwd(wd)