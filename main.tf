provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "fintech_data" {
  bucket = "fintech-customer-data-vault-test-123"
}

# ENFORCED ENCRYPTION
resource "aws_s3_bucket_server_side_encryption_configuration" "crypto" {
  bucket = aws_s3_bucket.fintech_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ENFORCED PUBLIC ACCESS BLOCK
resource "aws_s3_bucket_public_access_block" "security_gate" {
  bucket                  = aws_s3_bucket.fintech_data.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}