import boto3
import os
import requests
import csv
from io import StringIO
from botocore.exceptions import ClientError

# AWS credentials
aws_access_key_id = os.environ.get('AWS_ACCESS_KEY_ID')
aws_secret_access_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region_name = 'us-east-1'  # Replace with your AWS region

# GitHub repository URL
github_repo_url = 'https://api.github.com/repos/just4jc/Northwind-Traders-Dataset/contents/'

# Amazon S3 bucket
s3_bucket = 'team2adonwtbucket'  # Update this

def get_last_row_primary_key(csv_content):
    reader = csv.reader(StringIO(csv_content))
    last_row = None
    for row in reader:
        if row:  # skip empty rows
            last_row = row
    return last_row[0] if last_row else None

def download_last_part_of_s3_file(s3_client, bucket, key):
    try:
        # Fetch the last bytes of the file. Adjust the range as needed.
        response = s3_client.get_object(Bucket=bucket, Key=key, Range='bytes=-1024')
        return response['Body'].read().decode('utf-8')
    except ClientError as e:
        print(f"Error fetching from S3: {e}")
        return None

def download_file_from_github(url):
    response = requests.get(url)
    response.raise_for_status()
    return response.text

s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)

response = requests.get(github_repo_url)
files = response.json()

for file_info in files:
    if file_info["name"].endswith(".csv"):
        # Fetch last part of the file from S3
        s3_content = download_last_part_of_s3_file(s3, s3_bucket, file_info['name'])
        s3_last_key = get_last_row_primary_key(s3_content) if s3_content else None

        # Download file from GitHub
        github_content = download_file_from_github(file_info['download_url'])
        github_last_key = get_last_row_primary_key(github_content)

        if github_last_key != s3_last_key:
            print(f"Updating {file_info['name']} in S3 bucket")
            s3.put_object(Bucket=s3_bucket, Key=file_info['name'], Body=github_content)
        else:
            print(f"No update required for {file_info['name']}")
