module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.s3_bucket_name

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets

  versioning = {
    enabled = var.s3_bucket_versioning
  }

  tags = {
    Owner= var.owner_tag
  }

  # Adding Bucket Policy
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "${module.s3_bucket.s3_bucket_arn}",
          "${module.s3_bucket.s3_bucket_arn}/*"
        ]
      }
    ]
  })
    attach_policy                            = true
}

resource "aws_s3_object" "s3_object_files" {
  for_each = fileset("./fsxs3/", "**")
  bucket   = module.s3_bucket.s3_bucket_id
  key      = each.value
  source   = "./fsxs3/${each.value}"
}


