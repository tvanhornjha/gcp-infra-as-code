variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Bucket Name"
  type        = string
}
