import pandas as pd
import snowflake.connector  # Assuming you are using Snowflake, adjust if using a different database
import os
import csv

# Replace with your Snowflake credentials
# account = os.getenv('DBT_ACCOUNT')
# user = os.getenv('DBT_USER')
# password = os.getenv('DBT_PASSWORD')
# warehouse = os.getenv('SNOWFLAKE_WAREHOUSE')
# schema = os.getenv('SNOWFLAKE_SCHEMA')
# database = 'NWTDATA'
# stage_name = 'NWT_STAGING'

conn = snowflake.connector.connect(
    account="VMRXVKW-EM09200",
    user="team2",
    password="Team2ado",
    warehouse="NWTWH",
    database="NWTDATA",
    schema="NWT"
)
# Define your SQL query

sql_query = '''
(SELECT
  'categoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryID LIKE '%NULL%'
UNION ALL
SELECT
  'categoryName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryName LIKE '%NULL%'
UNION ALL
SELECT
  'description' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE description LIKE '%NULL%'
UNION ALL
SELECT
  'picture' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE picture LIKE '%NULL%')

UNION ALL

(SELECT
  'categoryID' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryID IS NULL
UNION ALL
SELECT
  'categoryName' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryName IS NULL
UNION ALL
SELECT
  'description' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE description IS NULL
UNION ALL
SELECT
  'picture' AS column_name,
  COUNT(*) AS null_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE picture IS NULL)
'''

# Execute the query and load results into a DataFrame
df = pd.read_sql(sql_query, conn)

# Close the Snowflake connection
conn.close()

# Export DataFrame to Excel
text_file_path = text_file_path = './testing_category_output.txt'
df.to_csv(text_file_path, index=False)

print(f'Data exported to {text_file_path}')
