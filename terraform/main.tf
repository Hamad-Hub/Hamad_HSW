resource "aws_s3_bucket" "hsw-bucket" {
  bucket = "my-hsw-s3-bucket"

  tags = {
    Name        = "My bucket"
  }
}

resource "aws_s3_bucket_website_configuration" "s3web-confi" {
  bucket = aws_s3_bucket.hsw-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}