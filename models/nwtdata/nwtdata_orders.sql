{{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT *
FROM {{ ref ('fresh_orders') }}
{% if is_incremental() %}
WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT))  FROM {{this}})
{% endif %}
