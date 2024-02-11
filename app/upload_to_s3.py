import boto3
import logging


def upload_to_s3(bucket_name, filename):
    if not bucket_name or not filename:
        logging.error("No valid bucket or filename were passed", exc_info=True)
        return
    s3_client = boto3.resource("s3")
    return s3_client.Bucket(bucket_name).upload_file(filename, filename)
