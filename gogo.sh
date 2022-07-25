bkt=
bkt=""
instanceId="starships"
databaseId="shipbase"
sed -i "s/bucketname/$bkt/" startrek.json
gsutil cp startrek.json "gs://$bkt/"
gcloud dataflow jobs run in-to-spanner --gcs-location gs://dataflow-templates-us-central1/latest/GCS_Text_to_Cloud_Spanner --region us-central1 --staging-location gs://$bkt/temp --parameters instanceId=$instanceId,databaseId=$databaseId,importManifest=gs://$bkt/startrek.json
