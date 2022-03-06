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

variable "bucket_name" {
description = "GCS Bucket name. Value should be unique ."
type        = string
}
