import boto3
import os
import requests

def download_and_upload_to_s3(download_url, object_key, s3_bucket, aws_access_key_id, aws_secret_access_key, region_name):
    # Download data from GitHub
    response = requests.get(download_url)
    file_content = response.content

    # Upload data to Amazon S3
    s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)
    s3.put_object(Body=file_content, Bucket=s3_bucket, Key=object_key)

    print(f'Data loaded into S3 bucket: {s3_bucket}, Object key: {object_key}')

# AWS credentials
aws_access_key_id = os.environ.get('AWS_ACCESS_KEY_ID')
aws_secret_access_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region_name = 'us-east-1'  # Replace with your AWS region

# GitHub raw file URL
github_raw_url = 'https://raw.githubusercontent.com/just4jc/Northwind-Traders-Dataset/main/category.csv'

# Amazon S3 bucket and object key
s3_bucket = 'team2adonwtbucket'

# Extract the object key from the download URL
object_key = github_raw_url.split('/')[-1]

# Now you have the object key and download URL, and you can proceed with downloading and uploading
download_and_upload_to_s3(github_raw_url, object_key, s3_bucket, aws_access_key_id, aws_secret_access_key, region_name)

