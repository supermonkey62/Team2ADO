{{ config(materialized='incremental', unique_key='CUSTOMERID') }}

SELECT *
FROM {{ ref('raw_customer_fresh') }}
{% if is_incremental() %}
  -- Assuming CUSTOMERID is a unique identifier
  WHERE CUSTOMERID NOT IN (SELECT CUSTOMERID FROM {{ this }})
{% endif %}
