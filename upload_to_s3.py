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

# def download_and_upload_to_s3(file_url, object_key):
#     # Download data from GitHub
#     response = requests.get(file_url)
#     file_content = response.content

#     # Upload data to Amazon S3
#     s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)
#     s3.put_object(Body=file_content, Bucket=s3_bucket, Key=object_key)

#     print(f'Data loaded into S3 bucket: {s3_bucket}, Object key: {object_key}')

def download_and_upload_to_s3(file_url, object_key):
    # Upload data to Amazon S3 only if the file doesn't exist
    s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)

    try:
        # Check if the file already exists in the S3 bucket
        s3.head_object(Bucket=s3_bucket, Key=object_key)

        # File already exists, print a message and skip the upload
        print(f'File already exists in S3 bucket: {object_key}')
    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] == '404':
            # File does not exist, proceed with the upload
            response = requests.get(file_url)
            file_content = response.content
            s3.put_object(Body=file_content, Bucket=s3_bucket, Key=object_key)
            print(f'Data loaded into S3 bucket: {s3_bucket}, Object key: {object_key}')
        else:
            # Something went wrong, print the error message
            print(f'Error checking S3 bucket: {e}')


# Fetch file information from GitHub repository
response = requests.get(github_repo_url)
files = response.json()

# Download and upload each CSV file
for file_info in files:
    if file_info["name"].endswith(".csv"):
        file_name = file_info["name"]
        download_url = file_info["download_url"]

        # Extract the object key from the download URL
        object_key = file_name

        # Now you have the object key and download URL, and you can proceed with downloading and uploading
        download_and_upload_to_s3(download_url, object_key)



