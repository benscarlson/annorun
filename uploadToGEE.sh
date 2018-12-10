#----
#shpToGee.sh test_beu gs://annotate/export_to_ee users/benscarlson/annotate/tracks
#----
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Exiting"
    exit
fi

geeShapefileP=$1
geeDatName=$2 #test_data
gcsPath=$3 #gs://annotate/export_to_ee
geeAssetPF=$4 #users/benscarlson/annotate/tracks

echo $geeShapefileP
echo $geeDatName
echo $gcsPath
echo $geeAssetPF

echo "Uploading dataset $datName to $gcsPath/$datName"
gsutil -m cp -r $geeShapefileP $gcsPath

echo "Deleting asset in GEE if it already exists"
echo "This will return an error if the asset does not already exist."
#TODO: check if dataset already exists before doing rm, since error message is confusing
earthengine rm $geeAssetPF

echo "Starting GEE import task"
earthengine upload table $gcsPath/$geeDatName.shp --asset_id $geeAssetPF
