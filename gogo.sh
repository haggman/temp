bkt="name"
instanceId="starships"
table_name="shipbase"
sed -i "s/bucketname/$bkt/" startrek.json
sed -i "s/Ships/$table_name/" startrek.json
gsutil cp startrek.json "gs://$bkt/"
gcloud dataflow jobs run in-to-spanner --gcs-location gs://dataflow-templates-us-central1/latest/GCS_Text_to_Cloud_Spanner --region us-central1 --staging-location gs://$bkt/temp --parameters instanceId=$instanceId,databaseId=$databaseId,importManifest=gs://$bkt/startrek.json
