# ENFORCED KMS ENCRYPTION
resource "aws_s3_bucket_server_side_encryption_configuration" "crypto" {
  bucket = aws_s3_bucket.fintech_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}