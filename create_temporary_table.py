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
file_format_name = 'my_csv_format'
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
cs.execute(f"CREATE OR REPLACE FILE FORMAT {file_format_name} TYPE = CSV FIELD_DELIMITER = ',' PARSE_HEADER = TRUE")
cs.execute(f"CREATE OR REPLACE FILE FORMAT {load_format_name} TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1")

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
    infer_schema_query = f"SELECT * FROM TABLE(INFER_SCHEMA(LOCATION=>'@{stage_name}/{file_name}', FILE_FORMAT=>'{file_format_name}'))"
    cs.execute(infer_schema_query)
    columns = cs.fetchall()

    # Access the column names
    column_names = [col[0] for col in columns]

    # Construct the column names into a string
    column_names_string = ', '.join(column_names)

    # Create temporary table using specified column definitions
    create_temp_table_query = f"CREATE TEMPORARY TABLE TEST_{table_name} AS SELECT {column_names_string} FROM @{stage_name}/{file_name}(FILE_FORMAT => '{file_format_name}');"
    print(create_temp_table_query)
    cs.execute(create_temp_table_query)

    print(f"Successfully created temporary table TEST_{table_name}")


cs.close()
ctx.close()


