import os
import snowflake.connector

# Define the path for the text file
text_file_path = 'testing_intermediate.txt'

# Check if the file exists, and create it if not
if not os.path.exists(text_file_path):
    with open(text_file_path, 'w'):
        pass  # This creates an empty file

# Open the file in write mode (will overwrite existing content)
with open(text_file_path, 'w') as text_file:
    # Replace with your Snowflake credentials
    account = os.getenv('DBT_ACCOUNT')
    user = os.getenv('DBT_USER')
    password = os.getenv('DBT_PASSWORD')
    warehouse = os.getenv('SNOWFLAKE_WAREHOUSE')
    schema = os.getenv('SNOWFLAKE_SCHEMA')
    database = 'NWTDATA'

    # Connect to Snowflake
    conn = snowflake.connector.connect(
    account=account,
    user=user,
    password=password,
    warehouse=warehouse,
    database=database,
    schema=schema
    )

    cs = conn.cursor()

    # Fetch tables from INFORMATION_SCHEMA.TABLES
    cs.execute(f"SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'INTERMEDIATE_%' AND TABLE_SCHEMA = 'NWT'")
    tables = [row[0] for row in cs.fetchall()]
    print(f"Tables in the schema: {tables}")

    # Process each table
    for table_name in tables:
        # Fetch columns from INFORMATION_SCHEMA.COLUMNS
        cs.execute(f"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{table_name}' AND TABLE_SCHEMA = 'NWT'")
        columns = cs.fetchall()

        # Access the column names
        column_names = [col[0] for col in columns]
        print(f"\n{table_name} TABLE:")
        print(f"Columns in {table_name}: {column_names}\n")

        text_file.write(f"\nTable: {table_name}\n")
        
        # Check for null values, "NULL" string, and negative values
        null_values_summary = {}
        null_string_summary = {}
        negative_values_summary = {}

        for column_name in column_names:
            # Check for null values
            check_null_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} IS NULL;"
            cs.execute(check_null_query)
            null_count = cs.fetchone()[0]
            null_values_summary[(table_name, column_name)] = null_count

            # Check for "NULL" string in every column
            check_null_string_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} LIKE '%NULL%';"
            cs.execute(check_null_string_query)
            null_string_count = cs.fetchone()[0]
            null_string_summary[(table_name, column_name)] = null_string_count

            # Check for negative values (assuming the data type is numeric)
            if any(col[0] == column_name and col[1] in ('NUMBER', 'INTEGER', 'FLOAT', 'DOUBLE') for col in columns):
                check_negative_query = f"SELECT COUNT(*) FROM NWTDATA.NWT.{table_name} WHERE {column_name} < 0;"
                cs.execute(check_negative_query)
                negative_count = cs.fetchone()[0]
                negative_values_summary[(table_name, column_name)] = negative_count

        # Write summaries to the text file
        text_file.write("Null Values Summary:\n")
        print("Null Values Summary:")
        for (table_name, column_name), null_count in null_values_summary.items():
            text_file.write(f"Null count in {column_name} of {table_name}: {null_count}\n")
            print(f"Null count in {column_name} of {table_name}: {null_count}")

        text_file.write("\nNull String Summary:\n")
        print("\nNull String Summary:")
        for (table_name, column_name), null_string_count in null_string_summary.items():
            text_file.write(f"'NULL' String count in {column_name} of {table_name}: {null_string_count}\n")
            print(f"'NULL' String count in {column_name} of {table_name}: {null_string_count}")

        text_file.write("\nNegative Values Summary:\n")
        print("\nNegative Values Summary:")
        for (table_name, column_name), negative_count in negative_values_summary.items():
            text_file.write(f"Negative values count in {column_name} of {table_name}: {negative_count}\n")
            print(f"Negative values count in {column_name} of {table_name}: {negative_count}")

    cs.close()
    conn.close()

print(f'Data and null count information exported to {text_file_path}')

