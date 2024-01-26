 {{ config(materialized='incremental', unique_key='CUSTOMERID') }}

 SELECT *
FROM {{ ref ('raw_customer_fresh') }}
 {% if is_incremental() %}
WHERE CAST(CUSTOMERID AS BIGINT) > (SELECT MAX(CAST(CUSTOMERID AS BIGINT))  FROM {{this}})
{% endif %}

