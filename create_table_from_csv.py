import os
import snowflake.connector
import pandas as pd

# Snowflake connection parameters
snowflake_account = os.getenv('DBT_ACCOUNT')
snowflake_user = os.getenv('DBT_USER')
snowflake_password = os.getenv('DBT_PASSWORD')
snowflake_database = os.getenv('SNOWFLAKE_DATABASE')
snowflake_schema = os.getenv('SNOWFLAKE_SCHEMA')  # Use the schema from GitHub Secrets
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

# Function to create a table based on CSV file
def create_table_from_stage(stage_name, file_name, table_name):
    # Copy data from Snowflake stage to the created table
    copy_query = f'COPY INTO {table_name} FROM @{stage_name}/{file_name} FILE_FORMAT=(TYPE=CSV FIELD_OPTIONALLY_ENCLOSED_BY=\'"\')'
    conn.cursor().execute(copy_query)

# List files in Snowflake stage
stage_name = "NWT_STAGING"  # Replace with the actual stage name
list_files_query = f"LIST '@{stage_name}/'"
result = conn.cursor().execute(list_files_query).fetchall()

# Loop through all CSV files in the stage
for file_info in result:
    file_name = file_info[0]  # File name is the first column in the result
    if file_name.endswith(".csv"):
        table_name = f'RAW_{file_name.replace(".csv", "")}'  # Remove extension for table name and prepend 'RAW_'
        create_table_from_stage(stage_name, file_name, table_name)

# Close the connection
conn.close()

