bkt="name"
instanceId="starships"
table_name="shipbase"
database_name="starbase"
sed -i "s/bucketname/$bkt/" startrek.json
sed -i "s/Ships/$table_name/" startrek.json
sed -i "s/bucketname/$bkt/" terraform.tfvars
sed -i "s/Ships/$table_name/" terraform.tfvars
sed -i "s/starships/$instanceId/" terraform.tfvars
sed -i "s/shipbase/$database_name/" terraform.tfvars
terraform init
terraform apply -auto-approve
gsutil cp startrek.json "gs://$bkt/"
gcloud dataflow jobs run in-to-spanner --gcs-location gs://dataflow-templates-us-central1/latest/GCS_Text_to_Cloud_Spanner --region us-central1 --staging-location gs://$bkt/temp --parameters instanceId=$instanceId,databaseId=$database_name,importManifest=gs://$bkt/startrek.json
