import os
import snowflake.connector
import csv
import requests
from io import StringIO
import boto3
from botocore.exceptions import ClientError

# AWS and Snowflake credentials
aws_access_key_id = os.environ.get('AWS_ACCESS_KEY_ID')
aws_secret_access_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
region_name = 'us-east-1'
account = os.environ.get('DBT_ACCOUNT')
user = os.environ.get('DBT_USER')
password = os.environ.get('DBT_PASSWORD')
warehouse = os.environ.get('SNOWFLAKE_WAREHOUSE')
schema = os.environ.get('SNOWFLAKE_SCHEMA')
database = 'NWTDATA'
stage_name = 'NWT_STAGING'
load_format_name = 'load_csv_format'
s3_bucket = 'team2adonwtbucket'
github_repo_url = 'https://api.github.com/repos/just4jc/Northwind-Traders-Dataset/contents/'

def get_last_row_primary_key(csv_content):
    reader = csv.reader(StringIO(csv_content))
    last_row = None
    for row in reader:
        if row:  # skip empty rows
            last_row = row
    return last_row[0] if last_row else None

def download_file_from_github(url):
    response = requests.get(url)
    response.raise_for_status()
    return response.text

def download_last_part_of_s3_file(s3_client, bucket, key):
    try:
        response = s3_client.get_object(Bucket=bucket, Key=key, Range='bytes=-1024')
        return response['Body'].read().decode('utf-8')
    except ClientError as e:
        return None

def upload_to_s3(s3_client, bucket, key, content):
    s3_client.put_object(Bucket=bucket, Key=key, Body=content)
    print(f'Updated {key} in S3 bucket {bucket}')

# Initialize AWS S3 client
s3 = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key, region_name=region_name)

# Initialize Snowflake connection
ctx = snowflake.connector.connect(
    account=account,
    user=user,
    password=password,
    warehouse=warehouse,
    database=database,
    schema=schema
)
cs = ctx.cursor()

# Process each file in the GitHub repository
response = requests.get(github_repo_url)
files = response.json()

for file_info in files:
    if file_info['name'].endswith('.csv'):
        # Fetch last part of the file from S3
        s3_content = download_last_part_of_s3_file(s3, s3_bucket, file_info['name'])
        s3_last_key = get_last_row_primary_key(s3_content) if s3_content else None

        # Download file from GitHub
        github_content = download_file_from_github(file_info['download_url'])
        github_last_key = get_last_row_primary_key(github_content)

        if github_last_key != s3_last_key:
            # Update the file in S3
            upload_to_s3(s3, s3_bucket, file_info['name'], github_content)

            # Replace the corresponding table in Snowflake
            table_name = file_info['name'].replace('.csv', '').upper()
            cs.execute(f"DROP TABLE IF EXISTS NWTDATA.NWT.RAW_{table_name}")
            cs.execute(f"CREATE OR REPLACE FILE FORMAT {load_format_name} TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '\"' FIELD_DELIMITER = ',' SKIP_HEADER = 1 NULL_IF=('NULL')")
            cs.execute(f"COPY INTO NWTDATA.NWT.RAW_{table_name} FROM @NWT_STAGING/{file_info['name']} FILE_FORMAT = '{load_format_name}';")
            print(f"Recreated table RAW_{table_name} in Snowflake with latest data")
            
        else:
            print(f"No update required for {file_info['name']}")

cs.close()
ctx.close()
