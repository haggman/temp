resource "google_spanner_instance" "challenge" {
  config       = "regional-us-central1"
  display_name = var.instance_id
  name = var.instance_id
  processing_units    = 100
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.challenge.name
  name     = var.database_name
  ddl = [
    "CREATE TABLE ${var.table_name} (ShipName STRING(200), Registry STRING(200), ShipClass STRING(200), Description STRING(2560), ) PRIMARY KEY(Registry)"
  ]
  deletion_protection = false
}