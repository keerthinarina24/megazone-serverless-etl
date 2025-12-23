provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.raw_bucket_name
}

resource "aws_s3_bucket" "processed_bucket" {
  bucket = var.processed_bucket_name
}

resource "aws_iam_role" "glue_role" {
  name = "megazone-glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "glue.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_glue_catalog_database" "db" {
  name = "clickstream_db"
}