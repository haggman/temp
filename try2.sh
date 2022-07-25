bkt=
instanceId=
databaseId=
gcloud dataflow jobs run in-to-spanner --gcs-location gs://dataflow-templates-us-central1/latest/GCS_Text_to_Cloud_Spanner --region us-central1 --staging-location gs://$bkt/temp --parameters instanceId=$instanceId,databaseId=$databaseId,importManifest=gs://$bkt/startrek.json