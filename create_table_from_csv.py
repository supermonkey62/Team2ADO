import os
import snowflake.connector
import pandas as pd

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

# Function to create a table based on CSV file from a Snowflake stage
def create_table_from_stage(stage_name, file_name, table_name):
    # Generate SQL column definitions based on the CSV file
    get_column_defs_query = f"SHOW COLUMNS IN {stage_name}/{file_name}"
    column_defs = ',\n'.join(row[2] + ' ' + row[3] for row in conn.cursor().execute(get_column_defs_query).fetchall())

    # Create the table dynamically
    create_table_query = f'CREATE TABLE RAW_{table_name} (\n{column_defs}\n)'
    conn.cursor().execute(create_table_query)

    # Copy data from the staged CSV file to the created table
    copy_query = f'COPY INTO RAW_{table_name} FROM @{stage_name}/{file_name} FILE_FORMAT=(TYPE=CSV FIELD_OPTIONALLY_ENCLOSED_BY=\'"\')'
    conn.cursor().execute(copy_query)

# Assume the files in the stage have a similar structure (columns)
# Loop through all files in the stage
stage_name = 'NWT_STAGING'
for file_name in os.listdir(stage_name):
    if file_name.endswith(".csv"):
        table_name = file_name.replace(".csv", "")  # Remove extension for table name
        create_table_from_stage(stage_name, file_name, table_name)

# Close the connection
conn.close()

