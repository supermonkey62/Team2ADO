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

file_format_name = 'my_csv_format'
load_format_name = 'load_csv_format'

s3_bucket = 'team2adonwtbucket'
github_repo_url = 'https://api.github.com/repos/just4jc/Northwind-Traders-Dataset/contents/'

def download_file_from_github(url):
    response = requests.get(url)
    response.raise_for_status()
    return response.text

def download_full_s3_file(s3_client, bucket, key):
    try:
        response = s3_client.get_object(Bucket=bucket, Key=key)
        return response['Body'].read().decode('utf-8')
    except ClientError as e:
        return None


def upload_to_s3(s3_client, bucket, key, content):
    s3_client.put_object(Bucket=bucket, Key=key, Body=content)
    # print(f'Updated {key} in S3 bucket {bucket}')

files_replaced = False

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

# Create the file formats (if it doesn't exist)
cs.execute(f"CREATE OR REPLACE FILE FORMAT {file_format_name} TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '\"' FIELD_DELIMITER = ',' PARSE_HEADER = TRUE")
cs.execute(f"CREATE OR REPLACE FILE FORMAT {load_format_name} TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '\"' FIELD_DELIMITER = ',' SKIP_HEADER = 1 NULL_IF=('NULL')")

# Process each file in the GitHub repository
response = requests.get(github_repo_url)
files = response.json()

# Process each file in the GitHub repository
for file_info in [file for file in files if file['name'].endswith('_fresh.csv')]:
        
    # Fetch the entire file from S3
    s3_content = download_full_s3_file(s3, s3_bucket, file_info['name'])

    # Download file from GitHub
    github_content = download_file_from_github(file_info['download_url'])

    if github_content != s3_content:

        files_replaced = True
        # Update the file in S3
        upload_to_s3(s3, s3_bucket, file_info['name'], github_content)


        # Replace the corresponding table in Snowflake
        table_name = file_info['name'].replace('.csv', '').upper()
        file_name = file_info["name"]


        infer_schema_query = f"SELECT * FROM TABLE(INFER_SCHEMA(LOCATION=>'@NWT_STAGING/{file_name}', FILE_FORMAT=>'{file_format_name}'))"
        cs.execute(infer_schema_query)
        columns = cs.fetchall()

        # Access the column names
        column_names = [col[0] for col in columns]


        # Construct the column definitions
        column_definitions = [f'"{col[0].replace(" ", "")}" {col[1]}' for col in columns]

        # Join the column definitions into a string
        columns_string = ',\n\t'.join(column_definitions)

        # Drop the existing RAW_%_FRESH TABLE
        cs.execute(f"DROP TABLE IF EXISTS NWTDATA.NWT.RAW_{table_name}")

        # Create the table using specified column definitions
        create_table_query = f"CREATE TABLE IF NOT EXISTS NWTDATA.NWT.RAW_{table_name} ({columns_string});"
        cs.execute(create_table_query)

        # Copy the latest fresh csv file into the replaced table
        cs.execute(f"COPY INTO NWTDATA.NWT.RAW_{table_name} FROM @NWT_STAGING/{file_name} FILE_FORMAT = '{load_format_name}';")

        # print(f"Recreated table RAW_{table_name} in Snowflake with latest data")
            
    #else:
        #print(f"No new data for {file_info['name']}")

cs.close()
ctx.close()

print('true' if files_replaced else 'false')