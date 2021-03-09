resource "aws_glue_catalog_database" "raw" {
  name = "exemplo_rony_database"
}

resource "aws_glue_crawler" "raw" {
  database_name = aws_glue_catalog_database.raw.name
  name          = "exemplo_rony_raw_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.dl.bucket}/raw-data/titanic"
  }

  configuration = <<EOF
{
   "Version": 1.0,
   "Grouping": {
      "TableGroupingPolicy": "CombineCompatibleSchemas" }
}
EOF

  tags = {
    foo = "bar"
  }
}