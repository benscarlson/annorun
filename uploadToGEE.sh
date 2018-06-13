#----
#shpToGee.sh test_beu gs://annotate/export_to_ee users/benscarlson/annotate/tracks
#----
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Exiting"
    exit
fi

datName=$1 #test_data
gcspath=$2 #gs://annotate/export_to_ee
assetpath=$3 #users/benscarlson/annotate/tracks

echo $datName
echo $gcspath
echo $assetpath

echo "Uploading dataset $datName to $gcspath/$datName"
gsutil -m cp -r tempfolder_"$datName"/shp/$datName $gcspath

echo "Deleting asset in GEE if it already exists"
echo "This will return an error if the asset does not already exist."
#TODO: check if dataset already exists before doing rm, since error message is confusing
earthengine rm $assetpath/$datName

echo "Starting GEE import task"
earthengine upload table $gcspath/$datName/$datName.shp --asset_id $assetpath/$datName
