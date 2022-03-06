variable "project_name" {
    type = string
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
}

variable "cred_file" {
    type = string
}

variable "network_name" {
    type = string
}

variable "gke_num_nodes" {
  default     = 1 
  description = "number of gke nodes"
}

variable "bucket_name" {
description = "GCS Bucket name. Value should be unique ."
type        = string
}

