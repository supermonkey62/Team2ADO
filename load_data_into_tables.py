import os
import snowflake.connector
import csv
from io import StringIO

# Replace with your Snowflake credentials
account = os.getenv('DBT_ACCOUNT')
user = os.getenv('DBT_USER')
password = os.getenv('DBT_PASSWORD')
warehouse = os.getenv('SNOWFLAKE_WAREHOUSE')
schema = os.getenv('SNOWFLAKE_SCHEMA')
database = 'NWTDATA'
stage_name = 'NWT_STAGING'
load_format_name = 'load_csv_format'
# Connect to Snowflake
ctx = snowflake.connector.connect(
    account=account,
    user=user,
    password=password,
    warehouse=warehouse,
    database=database,
    schema=schema
)

cs = ctx.cursor()

# Create the file format (if it doesn't exist)
cs.execute(f"CREATE OR REPLACE FILE FORMAT {load_format_name} TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '\"' FIELD_DELIMITER = ',' SKIP_HEADER = 1 NULL_IF=('NULL')")

# List CSV files in the stage
cs.execute(f"LIST @NWT_STAGING")
files = [row[0] for row in cs.fetchall() if row[0].endswith('.csv')]
#print(f"Files in the stage: {files}")

# Process each CSV file
for file_info in [file for file in files if file['name'] != 'product_fresh.csv']:
    # Extract the table name from the file path
    table_name = file.split('/')[-1].replace('.csv', '')
    file_name = file.split('/')[-1]

    # Check if the table already exists
    check_table_query = f"SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'RAW_{table_name.upper()}' AND TABLE_SCHEMA = 'NWT';"
    cs.execute(check_table_query)
    table_exists = cs.fetchone()[0] > 0

    if  table_exists:
        check_table_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.RAW_{table_name};"
        cs.execute(check_table_query)
        table_empty = cs.fetchone()[0] == 0

        if table_empty:
            # Load data into the table
            load_data_query = f"COPY INTO NWTDATA.NWT.RAW_{table_name} FROM @NWT_STAGING/{file_name} FILE_FORMAT = '{load_format_name}';"
            print(load_data_query)
            cs.execute(load_data_query)

            print(f"Successfully copied {file_name} into RAW_{table_name}")
        else:
            print("Table contains data, do not load more data in.")

    else:
        print(f"Table {table_name} does not exist.")

cs.close()
ctx.close()








