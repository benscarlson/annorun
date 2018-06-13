
annorun=~/projects/annorun #this is where you put the annorun code
datName=test_data #whatever you want to call the dataset

cd ~/scratch/anno #go to the directory where you want the final results

#saves dataset as a shapefile and formates fields for GEE
Rscript $annorun/prepForGEE.r $datName $annorun/data/test_data.csv

#Rscript $annorun/prepForGEE_custom.r $datName $annorun/data/test_data.csv

#Uploads the data to GCS then ingests into GEE
#[1] name of dataset
#[2] gcs bucket/folder to upload to
#[3] gee folder to add asset to
$annorun/uploadToGee.sh $datName gs://annotate/export_to_ee users/benscarlson/annotate/tracks

#---- Annotate in GEE ----#
# annotate_by_static_or_ts.js <--- earth engine script
#--------------------------#

#Downloads the raw data from GCS
#[1] name of dataset
#[2] gcs bucket/folder to download from
$annorun/getGEEraw.sh $datName gs://annotate

#Process the raw results and finalize the file
Rscript $annorun/processGEEraw.r $datName

rm -r tempfolder_"$datName" #clean up - remove temporary files and folders
