resource "aws_glue_crawler" "processed_crawler" {
  name          = "processed-clickstream-crawler"
  role          = aws_iam_role.glue_role.arn
  database_name = aws_glue_catalog_database.db.name

  s3_target {
    path = "s3://${var.processed_bucket_name}/parquet/"
  }
}
