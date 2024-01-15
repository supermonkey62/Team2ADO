import os
import snowflake.connector
import csv
from io import StringIO

# # Define the path for the text file
# text_file_path = './testing_category_output.txt'

# Define the path for the text file
text_file_path = 'testing1.txt'

# Check if the file exists, and create it if not
if not os.path.exists(text_file_path):
    with open(text_file_path, 'w'):
        pass  # This creates an empty file
    
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
# ctx = snowflake.connector.connect(
#     account=account,
#     user=user,
#     password=password,
#     warehouse=warehouse,
#     database=database,
#     schema=schema
# )

conn = snowflake.connector.connect(
    account="VMRXVKW-EM09200",
    user="team2",
    password="Team2ado",
    warehouse="NWTWH",
    database="NWTDATA",
    schema="NWTDATA.INFORMATION_SCHEMA"
)
# ... (other imports and variable definitions)

cs = conn.cursor()
# check_table_query = f"SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'RAW_{table_name.upper()}' AND TABLE_SCHEMA = 'NWT';"
# cs.execute(check_table_query)
# table_exists = cs.fetchone()[0] > 0
# Fetch tables from INFORMATION_SCHEMA.TABLES

# cs.execute(f"SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '{schema}'")
cs.execute(f"SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'RAW_%' AND TABLE_SCHEMA = 'NWT'")

# get_table_query = f"SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'NWT'"
# cs.execute(get_table_query)
tables = [row[0] for row in cs.fetchall()]
print(f"Tables in the schema: {tables}")

# Process each table
for table_name in tables:
    # Fetch columns from INFORMATION_SCHEMA.COLUMNS
    cs.execute(f"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table_name}' AND TABLE_SCHEMA = 'NWT'")
    columns = cs.fetchall()
    # Access the column names
    column_names = [col[0] for col in columns]
    print(f"Columns in {table_name}: {column_names}")

    # Construct the column definitions
    column_definitions = [f'{col[0]} {col[1]}' for col in columns]

    with open(text_file_path, 'a') as text_file:
        text_file.write(f"Table: {table_name}\n")
        # Check for null values, "NULL" string, and negative values
        
        for column_name in column_names:
            # Check for null values
            check_null_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} IS NULL;"
            cs.execute(check_null_query)
            null_count = cs.fetchone()[0]
            print(f"Null count in {column_name} of {table_name}: {null_count}")
            text_file.write(f"Null count in {column_name} of {table_name}: {null_count}\n")

            # Check for "NULL" string in columns with data type 'STRING'
            if any(col[0] == column_name and col[1] == 'STRING' for col in columns):
                check_null_string_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} = 'NULL';"
                cs.execute(check_null_string_query)
                null_string_count = cs.fetchone()[0]
                print(f"'NULL' string count in {column_name} of {table_name}: {null_string_count}")
                text_file.write(f"'String NULL' string count in {column_name} of {table_name}: {null_string_count}\n")
            # Check for negative values (assuming the data type is string)

 
            # Check for negative values (assuming the data type is numeric)
            if any(col[0] == column_name and col[1] in ('NUMBER', 'INTEGER', 'FLOAT', 'DOUBLE') for col in columns):
                check_negative_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} < 0;"
                cs.execute(check_negative_query)
                negative_count = cs.fetchone()[0]
                print(f"Negative count in {column_name} of {table_name}: {negative_count}")
                text_file.write(f"Negative values count in {column_name} of {table_name}: {negative_count}\n")


cs.close()
conn.close()

# # Process each table
# for table_name in tables:
#     # Fetch columns from INFORMATION_SCHEMA.COLUMNS
#     cs.execute(f"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table_name}' AND TABLE_SCHEMA = 'NWT'")
#     columns = cs.fetchall()
#     # Access the column names
#     column_names = [col[0] for col in columns]
#     print(f"Columns in {table_name}: {column_names}")

#     # Construct the column definitions
#     column_definitions = [f'{col[0]} {col[1]}' for col in columns]

#     with open(text_file_path, 'a') as text_file:
#         text_file.write(f"Table: {table_name}\n")
#         # Check for null values
#         for column_name in column_names:
#             check_null_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} IS NULL;"
#             cs.execute(check_null_query)
#             null_count = cs.fetchone()[0]
#             print(f"Null count in {column_name} of RAW_{table_name}: {null_count}")
#             text_file.write(f"Null count in {column_name} of RAW_{table_name}: {null_count}\n")


# cs.close()
# conn.close()

# # # Create a cursor
# # cursor = conn.cursor()

# # # Fetch tables from INFORMATION_SCHEMA
# # cursor.execute(f"SHOW TABLES IN SCHEMA {schema}")
# # tables = [row[1] for row in cursor.fetchall()]
# # print(f"Tables in the schema: {tables}")

# # # Process each table
# # for table_name in tables:
# #     print(f"Table Name: {table_name}")

# #     # Fetch columns from INFORMATION_SCHEMA.COLUMNS
# #     cursor.execute(f"SHOW COLUMNS IN TABLE {schema}.\"{table_name}\"")
# #     columns = [row[2] for row in cursor.fetchall()]

# #     # Process each column
# #     for column_name in columns:
# #         print(f"  Column Name: {column_name}")

# # # Close the cursor and connection
# # cursor.close()
# # conn.close()
# # --------------------------
# cs = conn.cursor()

# # Create the file format (if it doesn't exist)

# # Fetch tables from INFORMATION_SCHEMA
# cs.execute(f"SHOW TABLES IN SCHEMA {schema}")
# tables = [row[1] for row in cs.fetchall()]
# print(f"Tables in the schema: {tables}")

# # Process each table
# for table_name in tables:
#     # Check if the table already exists
#     check_table_query = f"SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'RAW_{table_name.upper()}' AND TABLE_SCHEMA = 'NWT';"
#     cs.execute(check_table_query)
#     table_exists = cs.fetchone()[0] > 0


#     # Fetch columns from INFORMATION_SCHEMA.COLUMNS
#     cs.execute(f"SHOW COLUMNS IN TABLE {schema}.\"{table_name}\"")
#     columns = [row[2] for row in cs.fetchall()]
#     # Access the column names
#     column_names = [col[0] for col in columns]
#     print(f"Columns in {table_name}: {column_names}")

#     # Construct the column definitions
#     column_definitions = [f'{col[0]} {col[1]}' for col in columns]

#     # Check for null values
#     for column_name in column_names:
#         check_null_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.RAW_{table_name} WHERE {column_name} IS NULL;"
#         cs.execute(check_null_query)
#         null_count = cs.fetchone()[0]
#         print(f"Null count in {column_name} of RAW_{table_name}: {null_count}")
#         # text_file.write(f"Null count in {column_name} of RAW_{table_name}: {null_count}\n")

        

# cs.close()
# conn.close()

# # df.to_csv(text_file_path, mode='a', header=False, index=False)

# # print(f'Data and null count information exported to {text_file_path}')