SELECT event_type, COUNT(*) AS total_events
FROM clickstream_parquet
GROUP BY event_type;

SELECT user_id, COUNT(*) AS actions
FROM clickstream_parquet
GROUP BY user_id;