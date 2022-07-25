bkt="csv-startrek-XXXXX"
sed -i "s/bucketname/$bkt/" startrek.json
gsutil cp startrek.json "gs://$bkt/"