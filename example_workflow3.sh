#TODO: Need to update this workflow
#This workflow is for processing data annotated in ee, 
# where the original file is not available
# and folders related to original upload of file are not available.

annorun=~/projects/annorun #this is where you put the annorun code
datName=tortuga_aqua_day #whatever you want to call the dataset

cd ~/scratch/anno
mkdir tempfolder_"$datName"
$annorun/getGEEraw.sh $datName gs://annotate
Rscript $annorun/processGEEraw.r $datName