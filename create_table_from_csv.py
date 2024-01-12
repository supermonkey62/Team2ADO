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
file_format_name = "CSV_FILE_FORMAT"

# Staged file name
staged_file_name = "category.csv"  # Replace with the actual staged file name

# Infer schema from the staged file
infer_schema_query = f"""
SELECT * FROM TABLE(INFER_SCHEMA(
 LOCATION=>'@{stage_name}/{staged_file_name}',
 FILE_FORMAT=>'{file_format_name}'));
"""

# Execute the query
result = conn.cursor().execute(infer_schema_query).fetchall()

# Generate column definitions for CREATE TABLE using TEMPLATE
columns_definition = ',\n'.join(f'"{col[0]}" {col[1]}' for col in result)

# Create the table using TEMPLATE
create_table_query = f"""
CREATE OR REPLACE TABLE RAW_{staged_file_name.replace(".csv", "")} USING TEMPLATE (
SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*)) 
 WITHIN GROUP (ORDER BY ORDER_ID)
 FROM TABLE (INFER_SCHEMA(
 LOCATION=>'@{stage_name}/{staged_file_name}',
 FILE_FORMAT=>'{file_format_name}')));
"""

# Execute the CREATE TABLE query
conn.cursor().execute(create_table_query)

# Copy data from the staged file into the created table
copy_query = f"""
COPY INTO RAW_{staged_file_name.replace(".csv", "")}
FROM '@{stage_name}/{staged_file_name}'
FILE_FORMAT = ('{file_format_name}');
"""

# Execute the COPY INTO query
conn.cursor().execute(copy_query)

# Close the connection
conn.close()


