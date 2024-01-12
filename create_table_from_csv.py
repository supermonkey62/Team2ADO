import os
import snowflake.connector

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

# Snowflake stage name
stage_name = "NWT_STAGING"

# File format
file_format_name = "MY_CSV_FORMAT"  # Change this to your desired file format name

# List files in Snowflake stage
list_files_query = f"LIST '@{stage_name}/'"
result = conn.cursor().execute(list_files_query).fetchall()

# Loop through all CSV files in the stage
for file_info in result:
    file_name = file_info[0]  # File name is the first column in the result
    if file_name.endswith(".csv"):
        # Create FILE FORMAT
        create_file_format_query = f"""
        CREATE OR REPLACE FILE FORMAT {file_name.replace(".csv", "")}_FORMAT
          TYPE = CSV
          FIELD_DELIMITER = ','
          SKIP_HEADER = 1
          FIELD_OPTIONALLY_ENCLOSED_BY='"'
          -- Explicitly specify the S3 bucket here
          -- Replace 'your-s3-bucket' with the actual bucket name
          STAGE_FILE_PATTERN = 's3://team2adonwtbucket/{stage_name}/{file_name}';
        """
        conn.cursor().execute(create_file_format_query)

        # Create TABLE using TEMPLATE
        create_table_query = f"""
        CREATE OR REPLACE TABLE RAW_{file_name.replace(".csv", "")} 
        USING TEMPLATE (
            SELECT * FROM @{stage_name}/{file_name} (FILE_FORMAT => '{file_name.replace(".csv", "")}_FORMAT')
        );
        """
        conn.cursor().execute(create_table_query)

        # COPY INTO the created TABLE
        copy_query = f"""
        COPY INTO RAW_{file_name.replace(".csv", "")}
        FROM '@{stage_name}/{file_name}'
        FILE_FORMAT = '{file_name.replace(".csv", "")}_FORMAT';
        """
        conn.cursor().execute(copy_query)

# Close the connection
conn.close()





