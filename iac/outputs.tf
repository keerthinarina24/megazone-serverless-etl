output "raw_bucket" {
  value = aws_s3_bucket.raw_bucket.bucket
}

output "processed_bucket" {
  value = aws_s3_bucket.processed_bucket.bucket
}