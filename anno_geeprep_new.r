library(dplyr)
library(readr)
library(devtools)

source('~/projects/anno/prepForAnno.r')

if(interactive()) {
  .resultsP <- '/Users/benc/projects/whitestork/results/stpp_models/beuster_sum13'
} else {
  .resultsP <- getwd()
}

#---- load data ----#
ents <- read_csv(file.path(.resultsP,'entities.csv'),col_types=cols())
dat0 <- read_csv(file.path(.resultsP,'data/obsbg.csv'),col_types=cols()) %>% 
  left_join(select(ents,individual_id,short_name),by='individual_id')

dat <- dat0 %>% slice(1:60)

write_csv(dat,'data/test_beu.csv')
prepForAnno(dat=dat,datName='test_beu',ptsPerGrpReq=20,extraFields=c('obs','short_name'))