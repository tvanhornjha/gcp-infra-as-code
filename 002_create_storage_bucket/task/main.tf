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
  project = "training-project-07" # TODO: your project ID
  region  = "us-central1"
}

# TODO: define a google_storage_bucket resource named "my_bucket"
resource "google_storage_bucket" "my_bucket" {
  name = "my_bucket"
  location = "us-central1"
}

