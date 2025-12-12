resource "random_id" "random" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_prefix}-${random_id.random.hex}"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.this.id

  depends_on = [
    aws_s3_bucket_versioning.versioning
  ]

  rule {
    id     = "current-version-transitions"
    status = "Enabled"

    transition {
      days          = var.standard_ia_days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.intelligent_days
      storage_class = "INTELLIGENT_TIERING"
    }

    ## ✅ Add Glacier Instant Retrieval
    transition {
      days          = var.glacier_instant_retrieval
      storage_class = "GLACIER_IR"
    }

    ## ✅ Add Glacier Flexible Retrieval
    transition {
      days          = var.glacier_flexible_retrieval
      storage_class = "GLACIER"
    }

    ## ✅ Add Glacier Deep Archive
    transition {
      days          = var.glacier_deep_archive
      storage_class = "DEEP_ARCHIVE"
    }

    expiration {
      days = var.expiration_days
    }
  }
}
