import boto3
import os
import requests
from urllib.parse import urlparse
import botocore

# AWS credentials
aws_access_key_id = os.environ.get('AWS_ACCESS_KEY_ID')
aws_secret_access_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region_name = 'us-east-1'  # Replace with your AWS region

# GitHub repository URL
github_repo_url = 'https://api.github.com/repos/just4jc/Northwind-Traders-Dataset/contents/'

# Amazon S3 bucket
s3_bucket = 'team2adonwtbucket'

def list_files_in_s3():
    s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)
    try:
        s3_contents = s3.list_objects(Bucket=s3_bucket)['Contents']
        return [item['Key'] for item in s3_contents]
    except Exception as e:
        print(f"Error listing S3 bucket contents: {e}")
        return []

def download_and_upload_to_s3(file_url, object_key):
    s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)
    response = requests.get(file_url)
    file_content = response.content
    s3.put_object(Body=file_content, Bucket=s3_bucket, Key=object_key)
    print(f'Data loaded into S3 bucket: {s3_bucket}, Object key: {object_key}')

# Fetch file information from GitHub repository
response = requests.get(github_repo_url)
files = response.json()

# List current files in S3
s3_files = list_files_in_s3()

# Flag to check if new data was added
new_data_added = False

# Download and upload each CSV file
for file_info in files:
    if file_info["name"].endswith(".csv"):
        file_name = file_info["name"]

        if file_name not in s3_files:
            new_data_added = True
            download_url = file_info["download_url"]
            download_and_upload_to_s3(download_url, file_name)

# Print message if no new data was added
if not new_data_added:
    print("No new data")



