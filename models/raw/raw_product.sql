 {{ config(materialized='incremental', unique_key='PRODUCTID') }}

 SELECT *
FROM {{ ref ('raw_product_fresh') }}
 {% if is_incremental() %}
WHERE CAST(PRODUCTID AS BIGINT) > (SELECT MAX(CAST(PRODUCTID AS BIGINT))  FROM {{this}})
{% endif %}