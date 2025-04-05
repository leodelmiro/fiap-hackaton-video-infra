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