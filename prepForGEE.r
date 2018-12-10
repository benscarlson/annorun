args <- commandArgs(trailingOnly=TRUE)
datPF <- args[1]
datAnnoIdPF <- args[2]
geeShapefileP <- args[3]

# if(is.na(datName)) stop('Dataset name is required')
# if(is.na(datP)) stop('Path to datset is required')
spsm <- suppressPackageStartupMessages

spsm(library(dplyr))
spsm(library(readr))

spsm(library(devtools))
install_local('~/projects/anno',dependencies=FALSE,quiet=TRUE) #won't install unless code changed
spsm(library(anno))

dat <- read_csv(datPF,col_type=cols())

prepForGEE(dat=dat,
  datAnnoIdPF=datAnnoIdPF,
  geeShapefileP=geeShapefileP)


