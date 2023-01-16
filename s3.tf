resource "aws_s3_bucket" "s3bucketcicd" {
  bucket = "${var.env_name}${var.s3-bucket-name}" 
  tags = local.common_tags
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }   

 
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.s3bucketcicd.id
  acl = "private"
  
}



