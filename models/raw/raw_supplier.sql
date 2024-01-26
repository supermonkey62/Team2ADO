 {{ config(materialized='incremental', unique_key='SUPPLIERID') }}

 SELECT *
FROM {{ ref ('raw_supplier_fresh') }}
 {% if is_incremental() %}
WHERE CAST(SUPPLIERID AS BIGINT) > (SELECT MAX(CAST(SUPPLIERID AS BIGINT))  FROM {{this}})
{% endif %}
