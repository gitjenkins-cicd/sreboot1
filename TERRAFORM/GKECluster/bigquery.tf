resource "google_logging_project_sink" "my-logging-sink" {
name = "my-bigquery-sink"
destination = "bigquery.googleapis.com/projects/gcp0tohero/datasets/${google_bigquery_dataset.dataset.dataset_id}"
filter = "resource.type = k8s_container OR k8s_pod"
unique_writer_identity = true
bigquery_options {
use_partitioned_tables = true
}
}

resource "google_project_iam_member" "log_writer" {
role = "roles/bigquery.dataEditor"
member = google_logging_project_sink.my-logging-sink.writer_identity
}

resource "google_bigquery_dataset" "dataset" {
dataset_id = "test_dataset"
description = "This is a test description"
location = "US"
delete_contents_on_destroy = true
labels = {
env = "default"
}
}


