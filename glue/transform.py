# Glue ETL Script (JSON → Parquet)

## glue/transform.py
python
import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext

args = getResolvedOptions(sys.argv, ["JOB_NAME"])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

raw_df = spark.read.json("s3://megazone-raw-clickstream-bucket/")

filtered_df = raw_df.select(
    "user_id",
    "event_type",
    "product_id",
    "timestamp"
)

filtered_df.write.mode("overwrite").parquet(
    "s3://megazone-processed-clickstream-bucket/parquet/"
)