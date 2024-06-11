resource "aws_s3_bucket" "tfstate" {
  bucket = format("%s-tfstate", var.prefix)
  force_destroy = true  
  tags = {
    Name = format("%s-tfstate", var.prefix)
  }
}

resource "aws_s3_bucket_versioning" "versioning_tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_tfstate" {
    bucket = aws_s3_bucket.tfstate.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "acess_block_tfstate" {
    bucket = aws_s3_bucket.tfstate.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

