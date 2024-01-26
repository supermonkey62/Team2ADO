 {{ config(materialized='incremental', unique_key='SHIPPERID') }}

 SELECT *
FROM {{ ref ('raw_shipper_fresh') }}
 {% if is_incremental() %}
WHERE CAST(SHIPPERID AS BIGINT) > (SELECT MAX(CAST(SHIPPERID AS BIGINT))  FROM {{this}})
{% endif %}
