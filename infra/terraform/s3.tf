resource "aws_s3_bucket" "video-ld" {
  bucket = "hackaton-tech-challenge-videos-ld"
}

resource "aws_s3_bucket_public_access_block" "public-acess-videos" {
  bucket = aws_s3_bucket.video-ld.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_zips" {
  bucket = aws_s3_bucket.video-ld.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowPublicReadAccessToZips",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.video-ld.arn}/zips/*"
      }
    ]
  })
}