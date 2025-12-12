variable "bucket_prefix" {
  type = string
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
  type = number
}

variable "tags" {
  type = map(string)
}

variable "region" {
  
}
  