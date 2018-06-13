#getGEEraw.sh test_beu gs://annotate
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Exiting"
    exit
fi

dataset=$1 #test_data
gcspath=$2 #gs://annotate

echo "Preparing to download annotated data for $gcspath/$dataset from GCS"

mkdir -p tempfolder_"$dataset"/raw

echo "Deleting any previosly downloaded raw gee data for this dataset"
rm tempfolder_"$dataset"/raw/*

echo "Downloading data"
gsutil -m cp $gcspath/$dataset/* tempfolder_"$dataset"/raw