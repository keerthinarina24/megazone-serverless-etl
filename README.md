\# Serverless Data Processing Pipeline (ETL/ELT)



\## Overview

This project demonstrates a serverless data processing pipeline on AWS for ingesting, transforming, and analyzing high-volume clickstream events.



\## Architecture

\- Amazon Kinesis Data Firehose for ingestion

\- Amazon S3 for storage (date-partitioned)

\- AWS Glue for transformation

\- AWS Glue Crawler for cataloging

\- Amazon Athena for querying

\- Terraform for Infrastructure as Code



\## Deployment

bash

cd iac

terraform init

terraform apply

