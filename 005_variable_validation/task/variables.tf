
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
  type = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "retention_days" {
  description = "Number of days to retain data."
  type        = number

  validation {
    condition     = var.retention_days > 0 && floor(var.retention_days) == var.retention_days
    error_message = "retention_days must be a positive integer greater than 0."
  }
}

