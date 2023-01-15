resource "aws_s3_bucket" "s3bucket-cicd" {
  bucket = "${var.env_name}${var.s3-bucket-name}"

  

  
  tags = local.common_tags

 
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = "${var.env_name}${var.s3-bucket-name}"
  acl = "private"
  
}


