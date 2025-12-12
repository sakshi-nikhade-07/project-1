module "s3_bucket" {
  source = "../../Terraform module/s3"

  bucket_prefix               = var.bucket_prefix

  standard_ia_days            = var.standard_ia_days
  intelligent_days            = var.intelligent_days
  glacier_instant_retrieval   = var.glacier_instant_retrieval
  glacier_flexible_retrieval  = var.glacier_flexible_retrieval
  glacier_deep_archive        = var.glacier_deep_archive

  expiration_days             = var.expiration_days

  tags = var.tags
}
