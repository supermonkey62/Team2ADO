import os
import snowflake.connector
import csv
from io import StringIO

# Snowflake connection parameters
snowflake_account = os.getenv('DBT_ACCOUNT')
snowflake_user = os.getenv('DBT_USER')
snowflake_password = os.getenv('DBT_PASSWORD')
snowflake_database = os.getenv('SNOWFLAKE_DATABASE')
snowflake_schema = os.getenv('SNOWFLAKE_SCHEMA')
snowflake_warehouse = os.getenv('SNOWFLAKE_WAREHOUSE')

# Connect to Snowflake
conn = snowflake.connector.connect(
    user=snowflake_user,
    password=snowflake_password,
    account=snowflake_account,
    warehouse=snowflake_warehouse,
    database=snowflake_database,
    schema=snowflake_schema
)

# Replace with your Snowflake credentials
account = os.getenv('DBT_ACCOUNT')
user = os.getenv('DBT_USER')
password = os.getenv('DBT_PASSWORD')
warehouse = os.getenv('SNOWFLAKE_WAREHOUSE')
database = os.getenv('SNOWFLAKE_DATABASE')
schema = os.getenv('SNOWFLAKE_SCHEMA')
stage_name = 'NWT_STAGING'
file_format_name = 'my_csv_format'

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
cs.execute(f"CREATE OR REPLACE FILE FORMAT {file_format_name} TYPE = CSV FIELD_DELIMITER = ',' PARSE_HEADER = TRUE")

# List CSV files in the stage
cs.execute(f"LIST @NWT_STAGING")
files = [row[0] for row in cs.fetchall() if row[0].endswith('.csv')]
print(f"Files in the stage: {files}")

# Process each CSV file
for file in files:
    # Extract the table name from the file path
    table_name = file.split('/')[-1].replace('.csv', '')
    file_name = file.split('/')[-1]

    # Use INFER_SCHEMA to get column definitions
    infer_schema_query = f"SELECT * FROM TABLE(INFER_SCHEMA(LOCATION=>'@NWT_STAGING/{file_name}', FILE_FORMAT=>'{file_format_name}'))"
    print(infer_schema_query)
    cs.execute(infer_schema_query)
    columns = cs.fetchall()

    # Access the column names
    column_names = [col[0] for col in columns]
    print("Column Names:", column_names)

    # Print the columns
    for col in columns:
        print(col)

    # Construct the column definitions
    column_definitions = [f'{header_names[index]} {col[1]}' for index, col in enumerate(columns)]

    # Join the column definitions into a string
    columns_string = ', '.join(column_definitions)

    print(columns_string)


    # # Use the header names from the CSV file (IGNORE THIS)
    # column_definitions = [f'{column_names[index]} {col[1]}' for index, col in enumerate(columns)]
    # columns_string = ', '.join(column_definitions)
    # print(column_string)

    # # Create the table using specified column definitions
    # create_table_query = f"CREATE TABLE IF NOT EXISTS {table_name} ({columns_string})"
    # print(create_table_query)
    # cs.execute(create_table_query)

    # # Load data into the table
    # cs.execute(f"COPY INTO {table_name} FROM @NWT_STAGING/{file} FILE_FORMAT = '{file_format_name}'")

cs.close()
ctx.close()








