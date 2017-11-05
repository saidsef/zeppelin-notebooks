# Demo Notebooks for Apache Zeppelin

Apache Zeppelin is a web-based, multi-purpose notebook for data discovery, prototyping, reporting, and visualization. With it’s Spark interpreter Zeppelin can also be used for rapid prototyping of streaming applications in addition to streaming-based reports.

## Prerequisite
  - JDK v8
  - Python
  - Boto3
  - AWS Account

## Import a note

This `POST` method imports a note from the note JSON input

```bash
CURL -XPOST http://[zeppelin-server]:[zeppelin-port]/api/notebook/import -d @CloudWatch-JSON.json
```

### Notebooks

| Description	| Components | Author | Comments	|
|------------- | ---------- 	| ------------  | --------  |
| AWS CloudTrail Demo | Spark/pySpark/SparkSQL | Said Sef | Parse and Analyze AWS CloudTrail Events |
