from pyspark.sql.functions import year, month, dayofmonth

# Read raw JSON data from S3
df = spark.read.json("s3://megazone-raw-clickstream-bucket/")

# Add partition columns derived from timestamp
df = df.withColumn("year", year("timestamp")) \
       .withColumn("month", month("timestamp")) \
       .withColumn("day", dayofmonth("timestamp"))

# Write transformed data in partitioned Parquet format
df.write \
  .mode("overwrite") \
  .partitionBy("year", "month", "day") \
  .parquet("s3://megazone-processed-clickstream-bucket/parquet/")
