terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      # TODO: pin a provider version, e.g. "~> 5.0"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  # TODO: set project (and optionally region/zone)
  project = "training-project-07" # TODO: replace with your project ID
  region  = "us-central1"
}

# TODO: add a `data "google_project" "this"` block
data "google_project" "this" {
}


# TODO: add an output that prints the project's display name
output "project print" {
  value = data.google_project.this.name
}