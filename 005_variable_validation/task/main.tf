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
  project = var.project_id # TODO: your project ID
  region  = var.region
}

# TODO: variable "environment" with a validation block restricting it
# to "dev", "staging", or "prod"

# TODO: variable "retention_days" with a validation block requiring
# a positive number

# TODO: google_storage_bucket "this" using var.environment in labels
# and var.retention_days in a lifecycle_rule
resource "google_storage_bucket" "project5_bucket" {
  name     = "my-data-bucket-${var.environment}"
  location = var.region

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }

  lifecycle_rule {
    condition {
      age = var.retention_days
    }

    action {
      type = "Delete"
    }
  }
}