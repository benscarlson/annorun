
#----
#---- Example workflow for annotating movement data
#----

annorun=~/projects/annorun #this is where you put the annorun code
geeDatName=test_data_anno #whatever you want to call the dataset
datPF=$annorun/data/test_data.csv
datAnnoIdPF=/Users/benc/scratch/anno/"$geeDatName".csv #TODO: try relative path
geeShapefileP=/Users/benc/scratch/anno/"$geeDatName"/shp #TODO: try relative path
gcsPath=gs://annotate/export_to_ee/$geeDatName
geeAssetPF=users/benscarlson/annotate/tracks/$geeDatName
annoRawP=/Users/benc/scratch/anno/"$geeDatName"_raw
gcsExportP=gs://annotate/$geeDatName
#outPF=/Users/benc/scratch/anno/"$geeDatName"2.csv #TODO: need a better name

cd ~/scratch/anno #go to the directory where you want the final results

#saves dataset as a shapefile and formates fields for GEE
Rscript $annorun/prepForGEE.r $datPF $datAnnoIdPF $geeShapefileP

#Rscript $annorun/prepForGEE_custom.r $datName $annorun/data/test_data.csv

#Uploads the data to GCS then ingests into GEE
#[1] name of shapefile
#[2] name of gee dataset
#[3] gcs bucket/folder to upload to
#[4] gee folder to add asset to
$annorun/uploadToGee.sh $geeShapefileP $geeDatName $gcsPath $assetPath

#---- Annotate in GEE ----#
# annotate_by_static_or_ts.js <--- earth engine script
#--------------------------#

#Downloads the raw data from GCS
#[1] name of dataset
#[2] gcs bucket/folder to download from
$annorun/getGEEraw.sh $gcsExportP $annoRawP

#Process the raw results and finalize the file
#Note that here we are overwriting the file, so make a backup copy
cp $datAnnoIdPF $datAnnoIdPF.bak

Rscript $annorun/processGEEraw.r $annoRawP $datAnnoIdPF $datAnnoIdPF

#TODO: figure out the best way to clean up
#rm -r tempfolder_"$datName" #clean up - remove temporary files and folders
