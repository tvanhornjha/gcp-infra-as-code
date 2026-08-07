variable "project_id" {
  description = "Project ID"
  type        = string
  default = "training-project-07"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "The env you are working in"
  type = string
  default = "dev"
}

variable "bucket_name" {
  description = "Bucket Name"
  type        = string
  default = "empty"
}
