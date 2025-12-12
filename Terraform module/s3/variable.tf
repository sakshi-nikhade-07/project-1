variable "bucket_prefix" {
  type        = string
  description = "Prefix for the S3 bucket name"
}

variable "standard_ia_days" {
  type = number
}

variable "intelligent_days" {
  type = number
}

variable "glacier_instant_retrieval" {
  type = number
}

variable "glacier_flexible_retrieval" {
  type = number
}

variable "glacier_deep_archive" {
  type = number
}

variable "expiration_days" {
  type        = number
  default     = 365
  description = "Number of days after which objects expire"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the bucket"
}
