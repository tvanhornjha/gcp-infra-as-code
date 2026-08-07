terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

# variable "project_id" {
#   type = string
# }

# variable "region" {
#   type    = string
#   default = "us-central1"
# }

# variable "environment" {
#   type    = string
#   default = "dev"
# }

# TODO: locals {
#   name_prefix   = "${var.project_id}-${var.region}"
#   common_labels = merge({ managed_by = "terraform" }, { environment = var.environment })
# }

locals {
   name_prefix   = "${var.project_id}-${var.region}"
   common_labels = merge({ managed_by = "terraform" }, { environment = var.environment })
 }

# TODO: google_storage_bucket "this" using local.name_prefix for its
# name and local.common_labels for its labels

resource "google_storage_bucket" "this" {
  name                        = "${local.name_prefix}-tommy-bucket"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
  labels                      = local.common_labels
}
