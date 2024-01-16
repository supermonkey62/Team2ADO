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
    infer_schema_query = f"SELECT * FROM TABLE(INFER_SCHEMA(LOCATION=>'@NWT_STAGING/{file_name}', FILE_FORMAT=>'{file_format_name}'))"
    # print(infer_schema_query)
    cs.execute(infer_schema_query)
    columns = cs.fetchall()

    # Access the column names
    column_names = [col[0] for col in columns]
    # print("Column Names:", column_names)

    # Construct the column definitions
    column_definitions = [f'{col[0]} {col[1]}' for col in columns]

    # Join the column definitions into a string
    columns_string = ',\n\t'.join(column_definitions)

    #print(columns_string)

    # Create the table using specified column definitions
    create_table_query = f"CREATE TEMPORARY TABLE TEMP_{table_name} ({columns_string});"
    print(create_table_query)
    cs.execute(create_table_query)

    print(f"Successfully created TEMP_{table_name}")

    # Load data into the table
    load_data_query = f"COPY INTO TEMP_{table_name} FROM @NWT_STAGING/{file_name} FILE_FORMAT = '{load_format_name}';"
    print(load_data_query)
    cs.execute(load_data_query)

    print(f"Successfully copied {file_name} into TEMP_{table_name}")

    # Get the number of rows and columns for the temporary table
    cs.execute(f"SELECT COUNT(*) FROM TEMP_{table_name}")
    temp_row_count = cs.fetchone()[0]

    cs.execute(f"SHOW COLUMNS IN TEMP_{table_name}")
    temp_columns = cs.fetchall()
    num_temp_columns = len(temp_columns)

    # Get the number of rows and columns for the actual table
    cs.execute(f"SELECT COUNT(*) FROM RAW_{table_name}")
    raw_row_count = cs.fetchone()[0]

    cs.execute(f"SHOW COLUMNS IN RAW_{table_name}")
    raw_columns = cs.fetchall()
    num_raw_columns = len(raw_columns)

    # Compare the number of rows and columns
    if temp_row_count == raw_row_count and num_temp_columns == num_raw_columns:
        print(f"Table comparison successful for TEMP_{table_name} ({temp_row_count},{num_temp_columns}) and RAW_{table_name} ({raw_row_count},{num_raw_columns})")
    else:
        raise ValueError(f"Table comparison failed for TEMP_{table_name} and RAW_{table_name}. "
                         f"Rows or columns do not match.")
    

cs.close()
ctx.close()


