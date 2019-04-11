#TODO: this script should go away, but can't figure out how to call R function directly from command line

args <- commandArgs(trailingOnly=TRUE)
datPF <- args[1]
datAnnoIdPF <- args[2]
geeShapefileP <- args[3]

spsm <- suppressPackageStartupMessages

spsm(library(dplyr))
spsm(library(readr))

spsm(library(devtools))
install_local('~/projects/anno',dependencies=FALSE,quiet=TRUE) #won't install unless code changed
spsm(library(anno))

prepForGEE(dat=datPF,
  datAnnoIdPF=datAnnoIdPF,
  geeShapefileP=geeShapefileP)


