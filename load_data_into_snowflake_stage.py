import os
import requests
from snowflake.connector import connect, Error

# GitHub repository details
github_repo = "https://github.com/just4jc/Northwind-Traders-Dataset.git"
github_api_url = f"https://api.github.com/repos/just4jc/Northwind-Traders-Dataset/contents"

# Snowflake connection details
snowflake_user = "team2"
snowflake_password = "Team2ado"
snowflake_account = "https://ui26303.ap-southeast-1.snowflakecomputing.com"
snowflake_database = "NWTDATA"
snowflake_warehouse = "NWTWH"

# Snowflake stage details
snowflake_stage = "NWT_STAGING"

def upload_to_snowflake_stage(conn, file_content, file_name, stage_name):
    cursor = conn.cursor()
    try:
        cursor.execute(f"PUT 'data:text/plain,{file_content}' @{stage_name}/{file_name}")
        print(f"File '{file_name}' uploaded to Snowflake stage '{stage_name}'.")
    except Error as e:
        print(f"Error uploading file to Snowflake: {e}")
    finally:
        cursor.close()

def main():
    # Connect to Snowflake
    try:
        conn = connect(
            user=snowflake_user,
            password=snowflake_password,
            account=snowflake_account,
            warehouse=snowflake_warehouse,
            database=snowflake_database
        )
        print("Connected to Snowflake.")
    except Error as e:
        print(f"Error connecting to Snowflake: {e}")
        return

    # Retrieve file information from GitHub API
    response = requests.get(github_api_url)
    files = response.json()

    # Upload each file content directly to Snowflake stage
    for file_info in files:
        if file_info["name"].endswith(".csv"):
            file_name = file_info["name"]
            download_url = file_info["download_url"]
            
            response = requests.get(download_url)
            file_content = response.content.decode('utf-8')
            
            upload_to_snowflake_stage(conn, file_content, file_name, snowflake_stage)

    # Close Snowflake connection
    conn.close()
    print("Disconnected from Snowflake.")

if __name__ == "__main__":
    main()
