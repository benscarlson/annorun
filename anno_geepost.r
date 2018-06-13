#---- commandline arguments ----#
args <- commandArgs(trailingOnly=TRUE)
#datName <- 'test3indivs'
datName <- args[1]
if(is.na(datName)) stop('datName required')

source('~/projects/helper_functions/elapsedMinSec.r')
source('src/scripts/stpp/stpp_funs.r')
source('src/scripts/annotations/procGEEoutput.r')
source('src/scripts/annotations/transRawVars.r')

#--------------------#
#---- Parameters ----#
#--------------------#

pars <- loadParams(datName)

#------------------------#
#---- GEE annotate ----#
#------------------------#

#---- process raw results ----#

res <- procGEEoutput(datName)

#---- transform to correct units where necessary ----#

datTrans <- transRawVars(res$dat,res$envLabs) %>%
  rename(individual_id=ind_id) #this should be more general. should rename after saving original when making shapefile.

write_csv(datTrans, file.path('results/stpp_models',datName,'data/obsbg_anno_gee.csv'))

#Can run report_envs at this point to look at results