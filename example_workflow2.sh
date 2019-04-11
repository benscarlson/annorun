#----
#---- Example workflow adding annotation to already annotated data
#----
annorun=~/projects/annorun #this is where you put the annorun code
geeDatName=test_data_anno #whatever you want to call the dataset
datAnnoIdPF=/Users/benc/scratch/anno/"$geeDatName".csv #TODO: try relative path
annoRawP=/Users/benc/scratch/anno/"$geeDatName"_raw
gcsExportP=gs://annotate/$geeDatName

#Assume the dataset is already uploaded to GEE
# Also assume the existing, annotated file has anno_id field

#Before running annotation, clear out any older annotation results
gsutil rm $gcsExportP/*

#---- Annotate in GEE ----#
# annotate_by_static_or_ts.js <--- earth engine script
#--------------------------#

# #Downloads the raw data from GCS
# #[1] name of dataset
# #[2] gcs bucket/folder to download from
# $annorun/getGEEraw.sh $gcsExportP $annoRawP

# delete any previosly downloaded raw gee data for this dataset"
rm $annoRawP/*

echo "Downloading data"
gsutil -m cp $gcsExportP/* $annoRawP

#Process the raw results and finalize the file
#Note that here we are overwriting the file, so make a backup copy
cp $datAnnoIdPF $datAnnoIdPF.bak

Rscript $annorun/processGEEraw.r $annoRawP $datAnnoIdPF $datAnnoIdPF