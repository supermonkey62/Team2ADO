import os
import requests
from snowflake.connector import connect, Error

# GitHub repository details
github_repo = "https://github.com/just4jc/Northwind-Traders-Dataset.git"
github_api_url = f"https://api.github.com/repos/just4jc/Northwind-Traders-Dataset/contents"

# Snowflake connection details
snowflake_user = "team2"
snowflake_password = "Team2ado"
snowflake_account = "VMRXVKW-EM09200"
snowflake_database = "NWTDATA"
snowflake_warehouse = "NWTWH"

# Snowflake stage details
snowflake_stage = "NWT_STAGING"

def upload_to_snowflake_stage(conn, file_url, file_name, stage_name):
  try:
    cursor = conn.cursor()
    with requests.get(file_url, stream=True) as response:
      response.raise_for_status()  # Raise an exception for non-200 status codes
      chunk_size = 1024 * 1024  # Set chunk size for streaming
      for chunk in response.iter_content(chunk_size=chunk_size):
        cursor.executemany("PUT file://%s @%s" % (file_name, stage_name), [chunk])
    print(f"File '{file_name}' streamed to Snowflake stage '{stage_name}'.")
  except Error as e:
    print(f"Error streaming file to Snowflake: {e}")

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
        upload_to_snowflake_stage(conn, download_url, file_name, snowflake_stage)

    # Close Snowflake connection
    conn.close()
    print("Disconnected from Snowflake.")

# Execute the main function
if __name__ == "__main__":
    main()

