import os
import snowflake.connector
import csv
from io import StringIO

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
    column_definitions = [f'{col[0]} {col[1]}' for col in columns]

    # Join the column definitions into a string
    columns_string = ',\n\t'.join(column_definitions)

    print(columns_string)

    # # Create the table using specified column definitions
    create_table_query = f"CREATE TABLE IF NOT EXISTS NWTDATA.RAW.RAW_{table_name} ({columns_string});"
    print(create_table_query)
    cs.execute(create_table_query)

    # # Load data into the table
    # cs.execute(f"COPY INTO {table_name} FROM @NWT_STAGING/{file} FILE_FORMAT = '{file_format_name}'")

cs.close()
ctx.close()








