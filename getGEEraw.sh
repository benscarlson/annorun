#getGEEraw.sh test_beu gs://annotate
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Exiting"
    exit
fi

gcsExportP=$1
annoRawP=$2

echo "Preparing to download annotated data for $gcsExportP from GCS"

mkdir -p $annoRawP

echo "Deleting any previosly downloaded raw gee data for this dataset"
rm $annoRawP/*

echo "Downloading data"
gsutil -m cp $gcsExportP/* $annoRawP