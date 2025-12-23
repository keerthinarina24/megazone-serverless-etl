from pyspark.sql.functions import year, month, dayofmonth

df = spark.read.json("s3://megazone-raw-clickstream-bucket/")

df = df.withColumn("year", year("timestamp")) \
       .withColumn("month", month("timestamp")) \
       .withColumn("day", dayofmonth("timestamp"))

df = df.filter(
    df.user_id.isNotNull() &
    df.event_type.isNotNull() &
    df.timestamp.isNotNull()
)

df.write \
  .mode("overwrite") \
  .partitionBy("year", "month", "day") \
  .parquet("s3://megazone-processed-clickstream-bucket/parquet/")
