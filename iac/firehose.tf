resource "aws_iam_role" "firehose_role" {
  name = "megazone-firehose-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "firehose.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "firehose_policy" {
  role       = aws_iam_role.firehose_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_kinesis_firehose_delivery_stream" "clickstream" {
  name        = "clickstream-firehose"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.raw_bucket.arn

    prefix = "year=!{timestamp:yyyy}/month=!{timestamp:MM}/day=!{timestamp:dd}/"
    buffering_size     = 5
    buffering_interval = 300
  }
}
