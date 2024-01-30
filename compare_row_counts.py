import os
import snowflake.connector
import csv
import requests
from io import StringIO

# Snowflake credentials
account = os.environ.get('DBT_ACCOUNT')
user = os.environ.get('DBT_USER')
password = os.environ.get('DBT_PASSWORD')
warehouse = os.environ.get('SNOWFLAKE_WAREHOUSE')
schema = os.environ.get('SNOWFLAKE_SCHEMA')
database = 'NWTDATA'

# Snowflake tables to compare
table1 = 'RAW_ORDER'
table2 = 'RAW_ORDER_FRESH'
table3 = 'RAW_ORDER_DETAIL'
table4 = 'RAW_ORDER_DETAIL_FRESH'

# Initialize Snowflake connection
ctx = snowflake.connector.connect(
    account=account,
    user=user,
    password=password,
    warehouse=warehouse,
    database=database,
    schema=schema
)
cs = ctx.cursor()

# Function to get row count for a table
def get_row_count(table):
    query = f"SELECT COUNT(*) FROM {table}"
    cs.execute(query)
    result = cs.fetchone()
    return result[0]

# Get row counts for both tables
row_count_table1 = get_row_count(table1)
row_count_table2 = get_row_count(table2)
row_count_table3 = get_row_count(table3)
row_count_table4 = get_row_count(table4)

# Compare row counts
if row_count_table1 == row_count_table2:
    print(f"Row counts for {table1} and {table2} are equal: {row_count_table1}")
else:
    print(f"Row counts for {table1} and {table2} are not equal")
    print(f"{table1}: {row_count_table1}")
    print(f"{table2}: {row_count_table2}")

if row_count_table3 == row_count_table4:
    print(f"Row counts for {table3} and {table4} are equal: {row_count_table3}")
else:
    print(f"Row counts for {table3} and {table4} are not equal")
    print(f"{table3}: {row_count_table3}")
    print(f"{table4}: {row_count_table4}")

cs.close()
ctx.close()

