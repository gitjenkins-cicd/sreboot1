resource "google_storage_bucket" "gcp0tohero_bucket" {
name     = var.bucket_name
location = var.region
}

terraform {
  backend "gcs" {
    bucket         = "gcp0toherostatefilegke"
    prefix         = "gcp0tohero-website"
  }
}
